/*==============================================================================
  PROJECT: LLM-Generated Informed Consent Evaluation
  TITLE: Descriptive Analysis of Consent Completeness Scores
  AUTHORS: Dr. Corey Basch & Dr. Erin Jacques
  DATE: December 2025
  SOFTWARE: Stata 18
==============================================================================*/

clear all
set more off

* Set working directory (adjust path as needed)
cd "/path/to/your/repo/data"

/*------------------------------------------------------------------------------
  1. LOAD AND PREPARE DATA
------------------------------------------------------------------------------*/

* Import scored responses
import delimited "scored_responses.csv", clear varnames(1)

* Display variable names to verify import
describe

* Generate completeness score by summing all 36 binary elements
* (Elements are in columns 3-38 based on CSV structure)
egen completeness_score = rowtotal(v3-v38)

* Label variables
label variable ai_platform "AI Model Used"
label variable disease "Cancer Diagnosis"
label variable completeness_score "Total Consent Completeness Score (0-35)"

* Verify score calculation
summarize completeness_score
assert completeness_score >= 0 & completeness_score <= 36

/*------------------------------------------------------------------------------
  2. DESCRIPTIVE STATISTICS - OVERALL
------------------------------------------------------------------------------*/

* Overall distribution of completeness scores
summarize completeness_score, detail

* Store key statistics
local median = r(p50)
local iqr_25 = r(p25)
local iqr_75 = r(p75)
local min = r(min)
local max = r(max)
local n = r(N)

* Display formatted summary
display _newline "=== OVERALL COMPLETENESS SCORE SUMMARY ==="
display "Sample size: `n'"
display "Median: `median'"
display "IQR: `iqr_25' - `iqr_75'"
display "Range: `min' to `max'"

/*------------------------------------------------------------------------------
  3. DESCRIPTIVE STATISTICS - BY CANCER TYPE
------------------------------------------------------------------------------*/

* Summary statistics by cancer diagnosis
display _newline "=== COMPLETENESS SCORES BY CANCER TYPE ==="
tabstat completeness_score, by(disease) statistics(n mean median min max iqr) format(%9.1f)

* Frequency distribution by diagnosis
tab disease, missing

/*------------------------------------------------------------------------------
  4. DESCRIPTIVE STATISTICS - BY AI MODEL
------------------------------------------------------------------------------*/

* Summary statistics by AI platform
display _newline "=== COMPLETENESS SCORES BY AI MODEL ==="
tabstat completeness_score, by(ai_platform) statistics(n mean median min max iqr) format(%9.1f)

* Frequency distribution by AI model
tab ai_platform, missing

/*------------------------------------------------------------------------------
  5. CROSSTABULATION
------------------------------------------------------------------------------*/

* Two-way table: AI model by cancer type
display _newline "=== SAMPLE DISTRIBUTION ==="
tab ai_platform disease, missing

/*------------------------------------------------------------------------------
  6. VISUALIZATION - FIGURE 1
------------------------------------------------------------------------------*/

* Dot plot of completeness scores by cancer type
graph dot completeness_score, ///
    over(disease, sort(1) label(labsize(small))) ///
    marker(1, msize(medium) mcolor(navy)) ///
    ytitle("Consent Completeness Score", size(medium)) ///
    yscale(range(20 36)) ylabel(20(2)36, angle(0)) ///
    title("Consent Completeness Scores by Cancer Diagnosis", ///
        size(medium) position(11)) ///
    note("Each dot represents one AI response (N=25)" ///
         "Score range: 0-35 (higher = more complete)", ///
         size(vsmall) position(7)) ///
    scheme(s2color) ///
    name(figure1, replace)

* Export figure
graph export "figure1_completeness_by_diagnosis.png", replace width(3000)
graph export "figure1_completeness_by_diagnosis.pdf", replace

/*------------------------------------------------------------------------------
  7. ALTERNATIVE VISUALIZATIONS
------------------------------------------------------------------------------*/

* Box plot alternative
graph box completeness_score, ///
    over(disease, label(labsize(vsmall) angle(45))) ///
    ytitle("Consent Completeness Score") ///
    title("Distribution of Completeness Scores by Cancer Type") ///
    note("N=5 per cancer type") ///
    name(boxplot, replace)

* Horizontal dot plot by AI model
graph dot completeness_score, ///
    over(ai_platform, sort(1) label(labsize(small))) ///
    marker(1, msize(medium) mcolor(maroon)) ///
    ytitle("Consent Completeness Score") ///
    title("Completeness Scores by AI Model") ///
    note("N=5 per AI model") ///
    name(ai_comparison, replace)

/*------------------------------------------------------------------------------
  8. ELEMENT-LEVEL ANALYSIS
------------------------------------------------------------------------------*/

* Calculate proportion of responses including each element
* (Useful for understanding which elements are most/least commonly omitted)

display _newline "=== ELEMENT INCLUSION RATES ==="
foreach var of varlist v3-v38 {
    quietly summarize `var'
    local pct = r(mean) * 100
    display "`var': " %4.1f `pct' "%"
}

* Identify most commonly omitted elements (scored 0)
egen elements_missing = rowtotal(v3-v38)
replace elements_missing = 36 - elements_missing
summarize elements_missing

/*------------------------------------------------------------------------------
  9. DATA EXPORT FOR TABLES
------------------------------------------------------------------------------*/

* Export summary table for manuscript
preserve
    collapse (n) n=completeness_score ///
             (mean) mean=completeness_score ///
             (median) median=completeness_score ///
             (min) min=completeness_score ///
             (max) max=completeness_score ///
             (p25) p25=completeness_score ///
             (p75) p75=completeness_score, ///
             by(disease)
    
    * Calculate IQR
    gen iqr = p75 - p25
    
    * Format for table
    format mean median min max %4.1f
    format iqr %4.1f
    
    * Export
    export delimited using "table1_summary_by_diagnosis.csv", replace
restore

/*------------------------------------------------------------------------------
  10. QUALITY CHECKS
------------------------------------------------------------------------------*/

* Verify balanced design (5 observations per cancer type)
display _newline "=== DESIGN BALANCE CHECK ==="
tab disease, missing
assert r(r) == 5  // Should have 5 cancer types

* Verify balanced design (5 observations per AI model)
tab ai_platform, missing
assert r(r) == 5  // Should have 5 AI models

* Check for any responses with perfect scores
count if completeness_score == 36
display "Number of responses with perfect scores (36/36): " r(N)

* Check for any responses with very low scores
count if completeness_score < 25
display "Number of responses with scores < 25: " r(N)

/*------------------------------------------------------------------------------
  END OF ANALYSIS
------------------------------------------------------------------------------*/

display _newline "=== ANALYSIS COMPLETE ==="
display "All results saved to working directory"
display "Figures saved as PNG and PDF"
display "Summary table exported as CSV"

log close
