#Abhijeet karne
#Practical No.8
library(ggplot2)
sample1 <- read.csv("D:/Desktop/data/Student Data1.csv")  
sample2 <- read.csv("D:/Desktop/data/Student Data1.csv")  
sample1
sample2
data1 <- sample1$Percentage
data2 <- sample2$Percentage
# Perform the Two-Sample t-Test
t_test_result <- t.test(data1, data2, var.equal= TRUE)
# Extract t-value and critical value
t_value <- t_test_result$statistic
t_critical <- qt(0.975, df = t_test_result$parameter)  # Two-tailed test, hence 0.975
# Print the results
cat("T-Value:", t_value, "\n")
cat("T-Critical Value:", t_critical, "\n")
# Combine data for plotting
combined_data <- data.frame(
  value = c(data1, data2),
  group = factor(rep(c("Sample 1", "Sample 2"), times = c(length(data1), length(data2))))
)

# Create a boxplot to visualize the data
ggplot(combined_data, aes(x = group, y = value, fill = group)) +
  geom_boxplot() +
  labs(title = "Boxplot of Two Samples", x = "Group", y = "Value") +
  theme_minimal()