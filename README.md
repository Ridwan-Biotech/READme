#Component 3: Analytical Interpretation

**Task: State clearly which of the three target biomarkers (Gene_A, Gene_B, or Gene_C)
exhibits a highly anomalous, split sub-distribu on within the Normal control pa ent
cohort.**

**answer:**

Among the three biomarkers:

Gene_A,

- Normal cohort is **tight and uniform**

<!-- -->

-  No visible subgroups or splitting

Gene_B,

- Normal shows **moderate spread**

<!-- -->

-  But still **single continuous distribution**

Gene_C,

- Normal cohort shows **very wide dispersion**

<!-- -->

-  Values appear to form **two distinct expression levels**:

  -  a large low-expression group

  -  a separate higher-expression subgroup

    From the above discussion, we can conclude in,

    Gene_C exhibits a highly anomalous, split sub-distribution within the Normal control cohort.

**Secton 2: The Biological Paradox**

Task: Describe what you observe when you look closely at the individual patient data
points (geom_jitter()) for this specific gene compared to its overall boxplot summary.

Answer: Although the boxplot suggests a simple difference between Normal and Tumor groups, geom_jitter() would reveal that:

-  For **Gene_A**, Normal individuals are uniformly low with no hidden substructure.

-  For **Gene_B**, both groups are widely distributed with substantial overlap, masking clear biological separation.

-  For **Gene_C**, the Normal cohort contains a **hidden bimodal-like structure**, where the majority show low expression but a distinct subset behaves similarly to Tumor patients.

This indicates that **Gene_C is the most biologically informative marker**, potentially identifying early dysregulation or a pre-disease state within the Normal population.

**Section 3: The Biomedical Engineering Design Flaw**

In a bimodal distribution, the mean is mathematically a weighted average of two distinct subpopulations and does not represent either group accurately. Using this value as a diagnostic threshold places the cutoff in a biologically irrelevant region between the two modes. Clinically, this leads to significant misclassification—particularly false positives, where healthy individuals from the higher-expression subgroup are incorrectly diagnosed as diseased. This can result in unnecessary medical interventions, psychological distress, and reduced diagnostic reliability, making the mean an inappropriate metric for decision-making in heterogeneous biomarker distributions.
