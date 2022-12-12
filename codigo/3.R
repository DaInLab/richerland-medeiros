if (!("writexl") %in% installed.packages()) 
  install.packages("writexl")
library(writexl)

if (!("readxl") %in% installed.packages()) install.packages("readxl")

child_count <- c(0, 1, 2, 3, 4, 5, 6)
families <- c(17, 20, 28, 19, 7, 4, 5)
data <- data.frame("Childreen" = child_count, "Families" = families)
write_xlsx(table,file.path(getwd(), "dados/exercicio3.xls"))


accumulated_frequency = cumsum(data)
max <- max(cumsum(data)$Families)
family_median = max / 2
median_ = 2
fashion_ = 2

key <- c("median", "fashion")
value <- c(median_, fashion_)
barplot(value, main="Median and Fashion", xlab="Ratio", ylab="Child Count", names.arg = key, beside=TRUE, ylim=range(pretty(c(0, value))), cex.names = 0.9, xaxs = "i", col = c("red", "blue"))


fashion_
median_