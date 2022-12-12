if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio9.xls"), skip = 1, col_names = "salaries", col_types = c("numeric"))

freq_table = table(ds$salaries)

min_value = min(ds$salaries)
max_value = max(ds$salaries)
amplitude = max_value - min_value

h = 2
k = amplitude/h
inferior_lim = min_value
upper_lim = inferior_lim+(k*h)
breaks = seq(inferior_lim,upper_lim,h)

freq_dist_table = table(cut(ds$salaries,breaks = breaks, right = FALSE))

graph = hist( ds$salaries,  
                 main = "Histogram Waze X Employees", 
                 xlab = "Minimum Wage", 
                 ylab = "Employees Amount", 
                 ylim = c(0,10),
                 col = c("azure"), 
                 breaks = breaks,

)

axis(1, at=seq(inferior_lim,upper_lim,h))
axis(2, at=seq(0,26,2))
text(graph$mids, graph$counts, labels = graph$counts, adj = c(0.5, -0.5))

freq_table
amplitude
freq_dist_table