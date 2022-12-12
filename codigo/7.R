if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio7.xls"), skip = 1, col_names = c("Specialties", "attendance_count"), col_types = c("text","numeric"))

bp = barplot(ds$attendance_count,main="Daily Attendances", xlab = "Specialties", ylab = "Attendance Amount", names.arg = ds$Specialties, ylim = c(0,700),
             col=c("aquamarine", "azure", "cyan", "cornsilk", "coral","darkorange"))
text(bp, ds$attendance_count+25, labels = ds$attendance_count )