#Component 1: The Integrity & Wrangling Puzzle (30% Marks) 


#Installing and running the packages
install.packages("tidyverse")
install.packages("pheatmap")
install.packages("gtsummary")
library(tidyverse)
library(pheatmap)
library(gtsummary)
install.packages("BiocManager")
BiocManager::install("limma")
BiocManager::install("DESeq2")
sessionInfo()
library(readr)
library(dplyr)
library(stringr)
expr_data <- read_csv(raw_expression_matrix.csv)

#rename: raw_expression_matrix to expr_data and, raw_clinical_metadata to Clinical_data
expr_data <- raw_expression_matrix
clinical_data <- raw_clinical_metadata

#Creating and arranging expr_data with a new column "Patient_ID" with the data under Sample_Ref. 
expr_data <- expr_data %>%
  mutate(Patient_ID = str_replace_all(Sample_Ref, "_", "-"))

expr_data <- expr_data
head(expr_data)
str(expr_data)
head(clinical_data)
str(clinical_data)
is.na(clinical_data)
is.na(expr_data)

#joining the two .csv files entitled "expr_data and clinical_data"  using left_joint function and renamed "combined_data".  
combined_data <- left_join(expr_data, clinical_data, by= "Patient_ID")
str(combined_data)  

#deleting the column "Sample_Ref" from the new .csv file "Combined_data", having new name as "Cleaned_combined_data". 
library(dplyr)
Cleaned_combined_data <- combined_data %>%
  select(-Sample_Ref)


#Rearranging those columns into this following orders and renamed the column "Cleaned_combined_data_01". 
Cleaned_combined_data_01 <- Cleaned_combined_data %>%
  select(Patient_ID, Age, Gene_A, Gene_B, Gene_C, Condition)

#The mutate function is used to make those data in the "Age" column.
expression_data <- Cleaned_combined_data_01
str(expression_data$Age)
expression_data <- expression_data %>%
  mutate(Age = str_to_lower(Age),
         Age = str_replace_all(Age, "fifty-two", "52"),
         Age = str_replace_all(Age, "sixty-seven", "67"))
expression_data$Age <- as.numeric(expression_data$Age)

str(expression_data$Age)
str(expression_data$Gene_A)
str(expression_data$Gene_B)
str(expression_data$Gene_C)
is.na(expression_data)

#deleting the entire row having missing value.
Cleaned_expression_data <- na.omit(expression_data)
#This is the final table got named "Cleaned_Joined_data". 
Cleaned_joined_data <- Cleaned_expression_data


#Component 2: The Mul-Gene Visualiza on Paradox (40% Marks) 

#Convert your wide gene data into a dy long-format data structure using pivot_longer(). 
library(tidyr)
library(dplyr) 

head(Cleaned_joined_data)

long_data <- Cleaned_joined_data %>%
  pivot_longer(
    cols = c(Gene_A, Gene_B, Gene_C),
    names_to = "Gene",
    values_to = "Expression"
  )
head(long_data)
ggplot(long_data, aes(x = Condition, y = Expression, fill = Condition)) +
  geom_boxplot(outlier.shape = 21, outlier.size = 2, alpha = 0.6) +
  facet_wrap(~ Gene, scales = "free_y") +
  scale_fill_manual(values = c("Normal" = "#2980B9", "Tumor" = "#E74C3C")) +
  labs(
    title = "Gene Expression: Tumor vs Normal",
    x     = "Condition",
    y     = "Expression",
    fill  = "Condition"
  ) +
  theme_bw() +
  theme(legend.position = "bottom")




dir.create("Scripts")
save.image("Scripts/full_workspace.RData")






























































