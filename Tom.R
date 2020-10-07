#Installing packages
library(tidyverse)

#Reading data
breast_cancer_data <- read.csv(file = 'breast-cancer.csv')

#Summary of data
summary(breast_cancer_data)

#Replace '?' with NA
breast_cancer_data[breast_cancer_data == '?'] <- NA

#Checking for missing values
colSums(is.na(breast_cancer_data))

#Remove all columns with NA
breast_cancer_data <- na.omit(breast_cancer_data) 

#Add names to the different columns in the data.frame
colnames(breast_cancer) <- c("class","age","menopause","tumor_size","inv_nodes","node_caps","deg_malig","breast","breast_quad","irradiat")

#Bar Chart to visualize location 
breastQuadFreq <- table(breast_cancer$breast_quad)
barplot(breastQuadFreq)

breastAgeFreq <- table(breast_cancer$age)
barplot(breastAgeFreq)

tumorCount <- data.frame(table(breast_cancer$age, breast_cancer$tumor_size))
names(tumorCount) <- c("age", "tumor_size", "count")
ggplot(data = tumorCount, aes(x = age, y = count, fill = tumor_size)) + geom_bar(stat="identity")