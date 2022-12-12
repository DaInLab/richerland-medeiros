if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio1.xls"), skip = 1, col_names = "interest_rate", col_types = c("numeric"))

average =mean(ds$interest_rate)
median =median(ds$interest_rate)
standard_deviation = round(sd(ds$interest_rate),6)
variance = round(var(ds$interest_rate),6)
min_value = round(min(ds$interest_rate),2)
max_value = round(max(ds$interest_rate),2)
quartiles = round(quantile(ds$interest_rate, prob=c(.25,.5,.75)),2)


average
median
standard_deviation
variance
min_value
max_value
quartiles[1]
quartiles[3]








