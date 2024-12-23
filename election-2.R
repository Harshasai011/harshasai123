rm (list = ls())

elections <- read.csv("2020 November General Election - Turnout Rates.csv", header = TRUE)

head(elections)
getwd()

required_packages <- c("ggplot2", "dplyr", "tidyr", "corrplot")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  } else {
    library(pkg, character.only = TRUE)
  }
}

print("All required packages are successfully installed and loaded.")

install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("corrplot")

library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)

colnames(elections)

str(elections)


elections$VEP.Turnout.Rate <- as.numeric(gsub("%", "", elections$VEP.Turnout.Rate))

elections <- elections %>% filter(!is.na(VEP.Turnout.Rate))




# Clean VEP.Turnout.Rate to remove '%' signs and convert to numeric
elections$VEP.Turnout.Rate <- as.numeric(gsub("%", "", elections$VEP.Turnout.Rate))
ggplot(elections, aes(x = State, y = VEP.Turnout.Rate)) +
  geom_boxplot(outlier.shape = 16, outlier.colour = "red") +  
  labs(x = "State", y = "VEP Turnout Rate (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  



ggplot(elections, aes(x = VEP.Turnout.Rate)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "skyblue", color = "black") +  
  geom_density(color = "red") +  
  labs(x = "VEP Turnout Rate (%)", y = "Density") +
  theme_minimal()


