# Variable Codebook

## Dataset Description
**File:** `scored_responses.csv`  
**Unit of Analysis:** One AI-generated response per row  
**Total Observations:** 25 (5 AI models × 5 cancer diagnoses)  
**Total Variables:** 38 (2 identifiers + 36 scored elements)

---

## Important Note: Prompts vs. Elements

**6 Prompts Asked** → **36 Elements Scored**

This study used **6 standardized prompts** (one per FDA consent domain), but each AI response was evaluated for the presence of **36 specific FDA-mandated elements**. 

### How Each Prompt Maps to Scored Elements

| Prompt # | Prompt Topic | Elements Scored | Element IDs |
|----------|--------------|-----------------|-------------|
| **1** | Purpose of the Study | 5 elements | 1-5 |
| | | • Explains what clinical trials are | Element 1 |
| | | • Mentions purpose (find better treatments) | Element 2 |
| | | • Explains potential benefits | Element 3 |
| | | • Notes participation is voluntary | Element 4 |
| | | • Mentions advancing medical science | Element 5 |
| **2** | Eligibility Criteria | 6 elements | 6-11 |
| | | • Age requirements | Element 6 |
| | | • Confirmed diagnosis requirement | Element 7 |
| | | • Performance status/health requirements | Element 8 |
| | | • Prior treatment considerations | Element 9 |
| | | • Medical history restrictions | Element 10 |
| | | • Notes criteria vary by study | Element 11 |
| **3** | Study Procedures | 6 elements | 12-17 |
| | | • Screening tests/baseline assessments | Element 12 |
| | | • Regular monitoring visits | Element 13 |
| | | • Blood tests/laboratory work | Element 14 |
| | | • Imaging studies (MRI, CT scans) | Element 15 |
| | | • Treatment administration procedures | Element 16 |
| | | • Schedule/frequency of visits | Element 17 |
| **4** | Risks and Benefits | 6 elements | 18-23 |
| | | • Potential side effects mentioned | Element 18 |
| | | • Unknown/unforeseeable risks acknowledged | Element 19 |
| | | • Possible benefits described | Element 20 |
| | | • No guarantee of benefit stated | Element 21 |
| | | • Safety monitoring procedures | Element 22 |
| | | • Right to withdraw at any time | Element 23 |
| **5** | Time Commitment | 6 elements | 24-29 |
| | | • Study duration varies by trial | Element 24 |
| | | • Frequency of visits/appointments | Element 25 |
| | | • Length of individual appointments | Element 26 |
| | | • Follow-up period after treatment | Element 27 |
| | | • Time commitment varies by study phase | Element 28 |
| | | • Long-term monitoring may be required | Element 29 |
| **6** | Practical Details | 6 elements | 30-35 |
| | | • Research costs covered by sponsor | Element 30 |
| | | • Standard medical care costs may apply | Element 31 |
| | | • Travel/lodging considerations | Element 32 |
| | | • How to find trials (ClinicalTrials.gov) | Element 33 |
| | | • Contact research team for enrollment | Element 34 |
| | | • Recommendation to discuss with provider | Element 35 |

**Total: 6 prompts → 35 scored elements**

**This approach allows:**
- Granular assessment of consent completeness
- Identification of specific omissions within each consent domain
- Quantification of disclosure quality across FDA requirements

Each of the 36 elements below represents a discrete piece of information that FDA regulations require in informed consent (21 CFR §50.25).

---

## Identifier Variables

### AI_Platform
**Type:** Categorical  
**Description:** The AI model used to generate the response  
**Values:**
- `ChatGPT` - ChatGPT 5.2 (OpenAI)
- `Claude Sonnet 4.5` - Claude Sonnet version 4.5 (Anthropic)
- `Claude Haiku 4.5` - Claude Haiku version 4.5 (Anthropic)
- `Gemini Fast` - Google Gemini (Fast model)
- `Perplexity Best` - Perplexity AI assistant

### Disease
**Type:** Categorical  
**Description:** The cancer diagnosis used in the prompt template  
**Values:**
- `Glioblastoma` - Grade IV malignant glioma
- `Astrocytoma` - Grade II-III diffuse astrocytoma
- `Medulloblastoma` - Grade IV embryonal tumor
- `Pituitary adenoma` - Typically Grade I benign tumor
- `Meningioma` - Typically Grade I benign tumor

---

## Scored Element Variables

All element variables are **binary** (0/1):
- **1** = Element present in AI response
- **0** = Element absent or unclear in AI response

Elements are organized by FDA-mandated informed consent domain:

---

## Purpose Domain (Elements 1-5)

### explains_trials
**Variable:** Element 1  
**Description:** Response defines what clinical trials are  
**Coding:** 1 if explanation of clinical trials provided; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### mentions_purpose  
**Variable:** Element 2  
**Description:** Response states trials aim to find better treatments or advance knowledge  
**Coding:** 1 if research purpose explained; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### explains_benefits
**Variable:** Element 3  
**Description:** Response mentions access to new/experimental therapies  
**Coding:** 1 if potential for novel treatment access noted; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(2)

### notes_voluntary
**Variable:** Element 4  
**Description:** Response explicitly states participation is voluntary  
**Coding:** 1 if voluntary nature mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(8)

### mentions_science
**Variable:** Element 5  
**Description:** Response notes participation contributes to medical science  
**Coding:** 1 if altruistic/societal benefit mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

---

## Eligibility Domain (Elements 6-11)

### age_requirements
**Variable:** Element 6  
**Description:** Response discusses age-related eligibility criteria  
**Coding:** 1 if age factors mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### diagnosis_requirement
**Variable:** Element 7  
**Description:** Response indicates confirmed diagnosis needed  
**Coding:** 1 if diagnosis confirmation mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### performance_status
**Variable:** Element 8  
**Description:** Response discusses general health/functional status requirements  
**Coding:** 1 if health status criteria mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### prior_treatment
**Variable:** Element 9  
**Description:** Response mentions previous treatment considerations  
**Coding:** 1 if treatment history discussed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### medical_history
**Variable:** Element 10  
**Description:** Response notes medical history restrictions/requirements  
**Coding:** 1 if medical history factors mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### criteria_vary
**Variable:** Element 11  
**Description:** Response acknowledges eligibility varies by specific trial  
**Coding:** 1 if trial-specific variation noted; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

---

## Procedures Domain (Elements 12-17)

### screening_tests
**Variable:** Element 12  
**Description:** Response describes baseline screening/assessments  
**Coding:** 1 if screening process mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### monitoring_visits
**Variable:** Element 13  
**Description:** Response mentions regular monitoring appointments  
**Coding:** 1 if ongoing visits discussed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### blood_tests
**Variable:** Element 14  
**Description:** Response discusses laboratory/blood work  
**Coding:** 1 if lab testing mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### imaging_studies
**Variable:** Element 15  
**Description:** Response mentions imaging (MRI, CT, PET scans)  
**Coding:** 1 if imaging procedures discussed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### treatment_admin
**Variable:** Element 16  
**Description:** Response describes how treatment is administered  
**Coding:** 1 if treatment delivery explained; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### visit_schedule
**Variable:** Element 17  
**Description:** Response indicates frequency/schedule of visits  
**Coding:** 1 if visit frequency mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

---

## Risks and Benefits Domain (Elements 18-23)

### side_effects
**Variable:** Element 18  
**Description:** Response discusses potential adverse effects  
**Coding:** 1 if side effects/risks mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(2)

### unknown_risks
**Variable:** Element 19  
**Description:** Response explicitly acknowledges unforeseeable/unknown risks  
**Coding:** 1 if uncertainty about risks noted; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(2)

### possible_benefits
**Variable:** Element 20  
**Description:** Response describes potential benefits to participant  
**Coding:** 1 if benefits explained; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(3)

### no_guarantee
**Variable:** Element 21  
**Description:** Response states benefit is not guaranteed  
**Coding:** 1 if lack of guarantee explicitly mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(3)

### safety_monitoring
**Variable:** Element 22  
**Description:** Response describes how safety is monitored during trial  
**Coding:** 1 if monitoring procedures explained; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(6)

### withdrawal_rights
**Variable:** Element 23  
**Description:** Response mentions right to withdraw at any time  
**Coding:** 1 if withdrawal option stated; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(8)

---

## Time Commitment Domain (Elements 24-29)

### duration_varies
**Variable:** Element 24  
**Description:** Response notes study duration varies by trial  
**Coding:** 1 if variability in duration mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### visit_frequency
**Variable:** Element 25  
**Description:** Response discusses how often visits occur  
**Coding:** 1 if frequency addressed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### appointment_length
**Variable:** Element 26  
**Description:** Response mentions duration of individual appointments  
**Coding:** 1 if appointment time discussed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### followup_period
**Variable:** Element 27  
**Description:** Response discusses post-treatment follow-up  
**Coding:** 1 if follow-up period mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### phase_variation
**Variable:** Element 28  
**Description:** Response notes time commitment varies by study phase  
**Coding:** 1 if phase-based differences mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

### longterm_monitoring
**Variable:** Element 29  
**Description:** Response mentions potential for long-term monitoring  
**Coding:** 1 if long-term follow-up discussed; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(1)

---

## Practical Details Domain (Elements 30-35)

### sponsor_costs
**Variable:** Element 30  
**Description:** Response indicates research costs covered by sponsor  
**Coding:** 1 if sponsor payment mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(5)

### patient_costs
**Variable:** Element 31  
**Description:** Response notes some standard care costs may apply to patient  
**Coding:** 1 if patient financial responsibility mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(5)

### travel_logistics
**Variable:** Element 32  
**Description:** Response discusses travel or lodging considerations  
**Coding:** 1 if travel logistics mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(5)

### trial_registry
**Variable:** Element 33  
**Description:** Response references ClinicalTrials.gov or similar registry  
**Coding:** 1 if trial database mentioned; 0 if omitted  
**FDA Reference:** 21 CFR 50.25

### contact_team
**Variable:** Element 34  
**Description:** Response explains how to contact research team for enrollment  
**Coding:** 1 if contact process described; 0 if omitted  
**FDA Reference:** 21 CFR 50.25(a)(7)

### consult_provider
**Variable:** Element 35  
**Description:** Response recommends discussing with healthcare provider  
**Coding:** 1 if provider consultation encouraged; 0 if omitted  
**FDA Reference:** 21 CFR 50.25

---

## Derived Variables

### completeness_score
**Type:** Continuous (0-35)  
**Description:** Sum of all 35 scored elements  
**Calculation:** `rowsum(element1-element35)`  
**Interpretation:** Higher scores = more comprehensive informed consent disclosure  
**Range in Study:** 22-35 (observed)

---

## Missing Data

**Missing Data Handling:** None expected  
**Rationale:** All AI queries completed successfully; binary scoring produces no missing values

If technical failures occurred:
- Document in notes
- Code all elements as 0
- Flag observation for sensitivity analysis

---

## Data Quality Notes

**Inter-rater Reliability:** [If applicable, report kappa statistic]  
**Coding Decisions:** Conservative approach - uncertain elements coded as 0  
**Ambiguous Cases:** Documented in coding decision log

---

## Example Record

```
AI_Platform: ChatGPT
Disease: Glioblastoma
explains_trials: 1
mentions_purpose: 1
explains_benefits: 1
notes_voluntary: 0
...
completeness_score: 33
```

---

## References

- FDA. (2023). Informed consent guidance for clinical investigations (21 CFR §50.25)
- Study methodology: See METHODOLOGY.md

---

**Questions about coding or variables?**  
Contact: Dr. Corey Basch
