# Evaluating LLM-Generated Informed Consent: FDA-Aligned Audit Framework for AYA CNS Cancer Clinical Trials

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18294050.svg)](https://doi.org/10.5281/zenodo.18294050)

## Overview

This repository contains materials for replicating a structured audit of large language model (LLM) responses to informed consent questions about clinical trials for adolescent and young adult (AYA) patients with central nervous system (CNS) tumors. The study evaluates how completely publicly available AI tools cover FDA-mandated informed consent elements.

## Study Description

**Objective:** To evaluate the completeness of AI-generated informed consent information for clinical trials involving AYA patients with CNS tumors, using U.S. Food and Drug Administration (FDA)–aligned consent requirements as the benchmark.

**Design:** Structured audit of five publicly available LLMs using standardized prompts aligned with FDA informed consent requirements (21 CFR §50.25).

**Key Findings:** AI-generated informed consent responses showed substantial variability in completeness (median score: 33; IQR: 31-34; range: 22-35). No response achieved full coverage of all FDA-aligned consent elements, raising concerns about using general-purpose AI tools for consent-related health communication.

## Repository Contents

### Core Materials
- **`prompts/`** - Standardized prompts for querying AI about clinical trial consent
- **`evaluation/`** - FDA-aligned consent completeness checklist and scoring manual
- **`data/`** - Scored responses dataset and data collection protocol
- **`analysis/`** - Stata code for descriptive analyses

### Documentation
- **`METHODOLOGY.md`** - Detailed data collection procedures
- **`CODEBOOK.md`** - Variable definitions and coding scheme
- **`LICENSE.md`** - CC-BY 4.0 license

## Using These Materials

### To Replicate This Study
1. Use the prompts in `prompts/prompt_templates.md` with your chosen AI models
2. Apply the evaluation checklist from `evaluation/fda_consent_checklist.csv`
3. Score responses as present (1) or absent/unclear (0)
4. Sum scores to calculate consent completeness

### To Extend This Work
- **Different cancer types:** Replace the cancer diagnosis in the prompt template
- **Different AI models:** Query new LLMs as they become available
- **Longitudinal monitoring:** Re-run queries periodically to track changes over time
- **Other medical contexts:** Adapt prompts for surgical procedures, genetic testing, etc.

## Study Details

**AI Models Tested:**
- ChatGPT 5.2
- Claude Sonnet 4.5
- Claude Haiku 4.5
- Google Gemini (Fast)
- Perplexity

**Cancer Types Studied:**
- Glioblastoma
- Astrocytoma
- Medulloblastoma
- Meningioma
- Pituitary adenoma

**Data Collection:** December 2025, using incognito browser sessions

**Analysis Software:** Stata 18

## Key Results Summary

- **Sample:** 25 AI responses (5 models × 5 cancer types)
- **Median completeness score:** 33 out of 36 possible points
- **Range:** 22-35 points
- **Main finding:** Substantial variability in disclosure completeness across all AI models and cancer types

## Citation

If you use these materials, please cite:

**Repository:**
> Basch, C., & Jacques, E. (2026). Evaluating LLM-Generated Informed Consent: FDA-Aligned Audit Framework for AYA CNS Cancer Clinical Trials [Data set]. Zenodo. https://doi.org/10.5281/zenodo.18294050

**Manuscript:**
> [Full paper citation will be added upon publication]

## Authors

**Dr. Corey Basch** (Principal Investigator)  
William Paterson University

**Dr. Erin Jacques** (Co-Investigator)  
York College, City University of New York

## Acknowledgments

This study was conducted in collaboration with Erela Datuowei (Teachers College, Columbia University) and Dr. Griselda Chapa (York College, City University of New York).

## Funding

This research received no specific grant from any funding agency in the public, commercial, or not-for-profit sectors.

## License

This work is licensed under a Creative Commons Attribution 4.0 International License (CC-BY 4.0). You are free to share and adapt these materials with appropriate attribution.

## Contact

For questions about these materials or the study:  
Dr. Corey Basch: baschc@wpunj.edu
Dr. Ern Jacques: ejacques1@york.cuny.edu

## Related Resources

- FDA Informed Consent Guidance: https://www.fda.gov/regulatory-information/search-fda-guidance-documents/informed-consent
- ClinicalTrials.gov: https://clinicaltrials.gov/

---

**Note:** These materials represent a snapshot of AI performance in December 2025. AI model behavior may change over time as systems are updated.
