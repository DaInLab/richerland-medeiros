if (!("writexl") %in% installed.packages()) 
  install.packages("writexl")
library(writexl)

child_count <- c(0, 1, 2, 3, 4, 5, 6)
families <- c(17, 20, 28, 19, 7, 4, 5)
data <- data.frame("Childreen" = child_count, "Families" = families)
write_xlsx(table,file.path(getwd(), "dados/exercicio3.xls"))


accumulated_frequency = cumsum(data)
max <- max(cumsum(data)$Families)
family_median = max / 2
median_ = 2
fashion_ = 2


csx <- accumulated_frequency$Families
plot(x = data$Childreen,         # Plot of cumsum vector
     y = csx,
     main = "Cumulative Frequency Distribution",
     xlab = "Length of Example Vector",
     ylab = "Cumulative Sum")

rect(0, 60, 11, 0,              # Modify background color
     border = "black",
     col = "grey92")

abline(v = data$Childreen,       # Add vertical lines to plot
       col = "white",
       lty = "dashed")

abline(h = csx,                 # Add horizontal lines to plot
       col = "white",
       lty = "dashed")

points(x = data$Childreen,       # Add line to plot
       y = csx,
       col = "#1b98e0",
       type = "l")

points(x = data$Childreen,       # Add points to plot
       y = csx,
       col = "#1b98e0",
       pch = 16)

fashion_
median_