#expr_data, what is the last table

|     | **Sample_Ref** | **Gene_A** | **Gene_B** | **Gene_C** | **Patient_ID** |
|:----|:---------------|:-----------|:-----------|:-----------|:---------------|

|        |       |           |          |      |       |
|:-------|:------|:----------|:---------|:-----|:------|
| **1**  | PT_01 | 2.389248  | 5.902008 | 1.1  | PT-01 |
| **2**  | PT_02 | 2.418198  | 4.883143 | 1.3  | PT-02 |
| **3**  | PT_03 | 1.571981  | 5.193439 | 9.8  | PT-03 |
| **4**  | PT_04 | 2.279582  | 5.910022 | 1.0  | PT-04 |
| **5**  | PT_05 | 2.034269  | 5.967340 | 10.2 | PT-05 |
| **6**  | PT_06 | 1.874825  | 4.676231 | 1.2  | PT-06 |
| **7**  | PT_07 | 10.304400 | 4.854995 | 8.9  | PT-07 |
| **8**  | PT_08 | 8.257866  | 5.008599 | 9.5  | PT-08 |
| **9**  | PT_09 | 10.033774 | 5.627256 | 11.0 | PT-09 |
| **10** | PT_10 | 10.197220 | 4.249678 | 10.1 | PT-10 |
| **11** | PT_11 | 9.356322  | 5.780005 | 9.2  | PT-11 |
| **12** | PT_12 | 10.244982 | 5.704003 | 10.5 | PT-12 |

Showing 1 to 11 of 12 entries, 5 total columns

#long_data

|     | **Patient_ID** | **Age** | **Condition** | **Gene** | **Expression** |
|:----|:---------------|:--------|:--------------|:---------|:---------------|

|        |       |     |        |        |           |
|:-------|:------|:----|:-------|:-------|:----------|
| **1**  | PT-01 | 34  | Normal | Gene_A | 2.389248  |
| **2**  | PT-01 | 34  | Normal | Gene_B | 5.902008  |
| **3**  | PT-01 | 34  | Normal | Gene_C | 1.100000  |
| **4**  | PT-02 | 45  | Normal | Gene_A | 2.418198  |
| **5**  | PT-02 | 45  | Normal | Gene_B | 4.883143  |
| **6**  | PT-02 | 45  | Normal | Gene_C | 1.300000  |
| **7**  | PT-03 | 52  | Normal | Gene_A | 1.571981  |
| **8**  | PT-03 | 52  | Normal | Gene_B | 5.193439  |
| **9**  | PT-03 | 52  | Normal | Gene_C | 9.800000  |
| **10** | PT-04 | 61  | Normal | Gene_A | 2.279582  |
| **11** | PT-04 | 61  | Normal | Gene_B | 5.910022  |
| **12** | PT-04 | 61  | Normal | Gene_C | 1.000000  |
| **13** | PT-05 | 28  | Normal | Gene_A | 2.034269  |
| **14** | PT-05 | 28  | Normal | Gene_B | 5.967340  |
| **15** | PT-05 | 28  | Normal | Gene_C | 10.200000 |
| **16** | PT-06 | 41  | Normal | Gene_A | 1.874825  |
| **17** | PT-06 | 41  | Normal | Gene_B | 4.676231  |
| **18** | PT-06 | 41  | Normal | Gene_C | 1.200000  |
| **19** | PT-07 | 67  | Tumor  | Gene_A | 10.304400 |
| **20** | PT-07 | 67  | Tumor  | Gene_B | 4.854995  |
| **21** | PT-07 | 67  | Tumor  | Gene_C | 8.900000  |
| **22** | PT-08 | 50  | Tumor  | Gene_A | 8.257866  |
| **23** | PT-08 | 50  | Tumor  | Gene_B | 5.008599  |
| **24** | PT-08 | 50  | Tumor  | Gene_C | 9.500000  |
| **25** | PT-09 | 38  | Tumor  | Gene_A | 10.033774 |
| **26** | PT-09 | 38  | Tumor  | Gene_B | 5.627256  |
| **27** | PT-09 | 38  | Tumor  | Gene_C | 11.000000 |
| **28** | PT-10 | 55  | Tumor  | Gene_A | 10.197220 |
| **29** | PT-10 | 55  | Tumor  | Gene_B | 4.249678  |
| **30** | PT-10 | 55  | Tumor  | Gene_C | 10.100000 |
| **31** | PT-11 | 47  | Tumor  | Gene_A | 9.356322  |
| **32** | PT-11 | 47  | Tumor  | Gene_B | 5.780005  |
| **33** | PT-11 | 47  | Tumor  | Gene_C | 9.200000  |

Showing 1 to 11 of 33 entries, 5 total columns

![](images/clipboard-2089805671.png)

#Component 3: Analytical Interpretation

**Task: State clearly which of the three target biomarkers (Gene_A, Gene_B, or Gene_C) exhibits a highly anomalous, split sub-distribu on within the Normal control pa ent cohort.**

**answer:**

Among the three biomarkers:

Gene_A,

- Normal cohort is **tight and uniform**

<!-- -->

- No visible subgroups or splitting

Gene_B,

- Normal shows **moderate spread**

<!-- -->

- But still **single continuous distribution**

Gene_C,

- Normal cohort shows **very wide dispersion**

<!-- -->

- Values appear to form **two distinct expression levels**:

- a large low-expression group

- a separate higher-expression subgroup

```         
From the above discussion, we can conclude in,

Gene_C exhibits a highly anomalous, split sub-distribution within the Normal control cohort.
```

**Secton 2: The Biological Paradox**

Task: Describe what you observe when you look closely at the individual patient data points (geom_jitter()) for this specific gene compared to its overall boxplot summary.

Answer: Although the boxplot suggests a simple difference between Normal and Tumor groups, geom_jitter() would reveal that:

- For **Gene_A**, Normal individuals are uniformly low with no hidden substructure.

- For **Gene_B**, both groups are widely distributed with substantial overlap, masking clear biological separation.

- For **Gene_C**, the Normal cohort contains a **hidden bimodal-like structure**, where the majority show low expression but a distinct subset behaves similarly to Tumor patients.

This indicates that **Gene_C is the most biologically informative marker**, potentially identifying early dysregulation or a pre-disease state within the Normal population.

**Section 3: The Biomedical Engineering Design Flaw**

In a bimodal distribution, the mean is mathematically a weighted average of two distinct subpopulations and does not represent either group accurately. Using this value as a diagnostic threshold places the cutoff in a biologically irrelevant region between the two modes. Clinically, this leads to significant misclassification—particularly false positives, where healthy individuals from the higher-expression subgroup are incorrectly diagnosed as diseased. This can result in unnecessary medical interventions, psychological distress, and reduced diagnostic reliability, making the mean an inappropriate metric for decision-making in heterogeneous biomarker distributions.
