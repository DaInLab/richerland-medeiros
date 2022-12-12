list.of.packages <- c("readxl", "qcc")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(qcc)
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio6.xls"), skip = 1, col_names = c("Quality", "people_amount"), col_types = c("text","numeric"))
sorted_ds = ds[order(ds$people_amount, decreasing = TRUE),]
pareto.chart(sorted_ds$people_amount, main= "Research : How were you treated??", col=c("yellow", "orange", "blue", "red", "green"),
             ylab = "Frequency", xlab ="Answers", names=sorted_ds$Quality, las=1, ylim = c(0,100))