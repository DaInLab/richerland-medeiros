if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio4.xls"), skip = 1, col_names = "salaries", col_types = c("numeric"))
freq_table = table(ds$salaries)


min_value = min(ds$salaries)
max_value = max(ds$salaries)
amplitude = max_value - min_value
k = round(1+ log2(20))
h = round((amplitude/k),2)

inferior_lim = min_value
upper_lim = inferior_lim+(k*h)
breaks = seq(inferior_lim,upper_lim,h)
freq_dist_table = table(cut(ds$salaries,breaks = breaks, right = FALSE))

graph = hist( ds$salaries,  
                main = "Employees Salaries Histogram", 
                xlab = "Minimum Wages", 
                ylab = "Employees Count", 
                ylim = c(0,8),
                col = c("aquamarine", "azure", "cyan", "cornsilk", "coral","darkorange"), 
                breaks = breaks,
)

axis(1, at=seq(inferior_lim,upper_lim,h))
axis(2, at=seq(0,max_value,2))
text(graph$mids, graph$counts, labels = graph$counts, adj = c(0.5, -0.5))

freq_table
freq_dist_table
amplitude



