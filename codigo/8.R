if (!("readxl") %in% installed.packages()) 
  install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio8.xls"), skip = 1, col_names = "patients_height", col_types = c("numeric"))


freq_table = table(ds$patients_height)

min_value = min(ds$patients_height)
max_value = max(ds$patients_height)
amplitude = max_value - min_value

k = round(1+ log2(80))
h = round((amplitude/k),2)
inferior_lim = min_value
upper_lim = inferior_lim+(k*h)
breaks = seq(inferior_lim,upper_lim,h)
freq_dist_table = table(cut(ds$patients_height,breaks = breaks, right = FALSE))


graph = hist( ds$patients_height,  
                main = "Histogram Height x - Anomalies", 
                xlab = "Height", 
                ylab = "Amount", 
                ylim = c(0,26),
                col = c("aquamarine", "azure", "cyan", "cornsilk", "coral","darkorange"), 
                breaks = breaks,
)

axis(1, at=seq(inferior_lim,upper_lim,h))
axis(2, at=seq(0,26,2))
text(graph$mids, graph$counts, labels = graph$counts, adj = c(0.5, -0.5))

freq_table
amplitude
freq_dist_table