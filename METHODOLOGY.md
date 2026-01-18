# Data Collection Methodology

## Overview
This document describes the complete data collection protocol used in the study. Following this protocol will enable replication of the audit procedure with different AI models, cancer types, or time periods.

## Study Design
**Design Type:** Structured audit study  
**Data Collection Period:** December 2025 (one week)  
**Sample:** 25 AI responses (5 AI models × 5 cancer diagnoses)

## AI Models Tested

| AI Model | Version | Access Type | Provider |
|----------|---------|-------------|----------|
| ChatGPT | 5.2 | Free tier | OpenAI |
| Claude Sonnet | 4.5 | Free tier | Anthropic |
| Claude Haiku | 4.5 | Free tier | Anthropic |
| Gemini | Fast | Free tier | Google |
| Perplexity | Best | Free tier | Perplexity AI |

**Selection Rationale:** Only free, publicly accessible versions were tested to reflect what patients are most likely to encounter when seeking health information independently.

## Cancer Diagnoses Selected

Five CNS tumor types prevalent in the AYA population (ages 15-39):

1. **Glioblastoma** - Grade IV malignant glioma
2. **Astrocytoma** - Grade II-III diffuse glioma
3. **Medulloblastoma** - Grade IV embryonal tumor
4. **Meningioma** - Typically Grade I benign tumor
5. **Pituitary adenoma** - Typically Grade I benign tumor

**Selection Rationale:** 
- High prevalence in AYA population (Price et al., 2024; Wu et al., 2024)
- Span full spectrum from benign to highly malignant
- Represent major WHO tumor categories (Torp et al., 2022)
- Enable testing across diverse clinical severity

## Data Collection Protocol

### Step 1: Browser Setup
1. Open incognito/private browsing window
2. Clear all cookies and cache
3. Disable browser extensions
4. Navigate to AI platform

**Purpose:** Eliminate personalization effects and search history bias

### Step 2: Session Initiation
1. Create new chat session
2. Do not log in to personal accounts (use free, unauthenticated access)
3. Verify AI model version if displayed

### Step 3: Prompt Submission
For each cancer diagnosis:

1. **Load all 6 prompts** with diagnosis-specific wording
2. **Submit sequentially** within single session:
   - Prompt 1: Purpose of study
   - Prompt 2: Eligibility criteria
   - Prompt 3: Study procedures
   - Prompt 4: Risks and benefits
   - Prompt 5: Time commitment
   - Prompt 6: Practical details

3. **Wait for complete response** before submitting next prompt
4. **Do not interrupt** or rephrase prompts mid-response

### Step 4: Response Capture
1. **Copy entire response** including:
   - All text output
   - Any warnings or disclaimers
   - Citations or links provided
   - Formatting (bullet points, headers, etc.)

2. **Save to structured file** with metadata:
   - AI model and version
   - Cancer diagnosis
   - Prompt number
   - Date and time
   - Session ID (if available)

3. **Document any anomalies:**
   - Refusals to answer
   - Error messages
   - Unexpected outputs
   - Technical issues

### Step 5: Error Handling
If AI refuses, errors, or produces unusual output:

1. **Note the issue** in data collection log
2. **Wait 5-10 minutes**
3. **Retry in new incognito session**
4. If problem persists after 3 attempts:
   - Document the failure
   - Note any patterns (specific prompt, diagnosis, model)
   - Continue with next diagnosis/model

### Step 6: Session Management
After completing all 6 prompts for one diagnosis:

1. **Close browser window**
2. **Clear cache/cookies again**
3. **Open fresh incognito window** for next diagnosis
4. Maintain separate sessions for each AI model

## Response Evaluation Protocol

### Understanding the Evaluation Framework

**Important:** This study used **6 prompts** but scored for **36 elements**. Each prompt generated a response that was evaluated for multiple specific FDA-required disclosure items.

For example, when an AI answered the "purpose of study" prompt, that single response was checked for 5 separate elements:
1. Explains what clinical trials are
2. Mentions finding better treatments
3. Explains potential benefits
4. Notes participation is voluntary  
5. Mentions advancing medical science

This granular approach allows precise identification of which specific consent elements AI systems include or omit.

### Scoring Procedure
1. **Review complete AI response** for each prompt
2. **Apply FDA-aligned checklist** (36 elements total)
3. **Score each element:**
   - **1** = Present (element clearly mentioned)
   - **0** = Absent or unclear (not mentioned or ambiguous)

4. **Use conservative coding:**
   - When uncertain, score as 0
   - Element must be explicit, not implied
   - Partial mentions scored as 0 unless substantially complete

### Quality Control
**Coder Training:**
- Review FDA informed consent requirements (21 CFR §50.25)
- Practice scoring on pilot responses
- Discuss ambiguous cases with research team
- Establish inter-rater reliability (if multiple coders)

**Consistency Checks:**
- Double-code 10% of responses
- Calculate kappa statistic for agreement
- Resolve disagreements through discussion
- Document decision rules for ambiguous cases

## Data Management

### File Organization
```
data/
├── raw_responses/
│   ├── chatgpt/
│   │   ├── glioblastoma_session_transcript.txt
│   │   ├── astrocytoma_session_transcript.txt
│   │   └── ...
│   ├── claude_sonnet/
│   └── ...
├── scored_data/
│   └── master_scored_responses.csv
└── data_collection_log.xlsx
```

### Data Quality Indicators
Track throughout collection:
- Number of sessions completed
- Number of retries required
- Technical issues encountered
- Time per AI query set
- Any systematic patterns in failures

## Timeline

**Week 1 (December 2025):**
- Days 1-5: Primary data collection
- Days 6-7: Buffer for technical issues/retries

**Total Time Investment:**
- ~2 hours per AI model (5 diagnoses × 6 prompts)
- ~10 hours total data collection
- ~15 hours scoring and quality control

## Replication Considerations

### To Replicate Exactly:
- Use same AI model versions (if still available)
- Use same cancer diagnoses
- Follow incognito session protocol precisely
- Apply same scoring rubric

### To Extend the Study:
- **Temporal replication:** Re-run queries quarterly to track changes
- **Model comparison:** Add new AI platforms as they emerge
- **Diagnosis expansion:** Test additional cancer types
- **Geographic variation:** Query from different locations/languages

## Ethical Considerations

**No IRB Required:** 
- Public AI systems
- No human subjects
- No protected health information
- No identifiable data

**Transparency:**
- All queries submitted as stated
- No deception of AI systems
- Results reported honestly regardless of findings

## Data Availability

**What is Shared:**
- Scored response data (binary coding)
- Prompts used
- Evaluation checklist
- Analysis code

**What is Not Shared:**
- Complete AI response transcripts (due to volume)
- Sample responses available upon request

## Technical Specifications

**Hardware:**
- Standard laptop computer
- Stable internet connection

**Software:**
- Chrome/Firefox/Safari (current version)
- Stata 18 for analysis
- Excel/Google Sheets for data entry

**No Special Tools Required:**
- All AI platforms accessed via standard web browser
- No API access needed
- No specialized software

## Troubleshooting Guide

### Common Issues

**Problem:** AI refuses to answer health question  
**Solution:** Rephrase slightly to emphasize informational/educational purpose

**Problem:** AI session times out mid-response  
**Solution:** Note incomplete response, restart in fresh session

**Problem:** AI provides very brief non-responsive answer  
**Solution:** Score as 0 for all elements, document in notes

**Problem:** AI response is extremely long (>2000 words)  
**Solution:** Score all content regardless of length

### Documentation Requirements
For each issue:
- Record what happened
- Note which AI model, prompt, diagnosis
- Document resolution steps
- Include in data collection log

## References

This protocol was developed based on:
- FDA Informed Consent Guidance (21 CFR §50.25)
- Eysenbach et al. (2002) e-health quality assessment methods
- Best practices in AI evaluation research

---

**Questions about this protocol?**  
Contact: Principal Investigator, Dr. Corey Basch (see README for contact information)
