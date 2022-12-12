if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

# Data Source
ds = read_excel(file.path(getwd(), "dados/exercicio5.xls"), skip = 1, col_names = c("brand", "people"), col_types = c("text","numeric"))

bp = barplot(ds$people,main="Preferred Antipyretic", xlab = "brand", ylab = "People Amount", names.arg = ds$brand, ylim = c(0,50),
        col=c("aquamarine", "azure", "cyan", "cornsilk", "coral","darkorange"))
text(bp, ds$people+3, labels = ds$people )

summary(ds$people)
