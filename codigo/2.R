if (!("readxl") %in% installed.packages()) 
    install.packages("readxl")
library(readxl)

ds = read_excel(file.path(getwd(), "dados/exercicio2.xls"), skip = 1, col_names = "house_count", col_types = c("numeric"))
frequency_tab = table(ds$house_count)

min_value = min(ds$house_count)
max_value = max(ds$house_count)
amplitude = max_value - min_value
k = round(1+ log2(50))
h = round(amplitude/k)
inferior_lim = min_value
upper_lim = inferior_lim+(k*h)
breaks = seq(inferior_lim,upper_lim,h)
freq_dist_table = table(cut(ds$house_count,breaks = breaks, right = FALSE))
average =mean(ds$house_count)
median =median(ds$house_count)
modal = unique(ds$house_count) 
fashion = modal[which.max(tabulate(match(ds$house_count, modal)))]
quartile = round(quantile(ds$house_count, prob=c(.25,.5,.75)),2)
variance = var(ds$house_count)
standard_deviation = sd(ds$house_count)
variation_coeff = standard_deviation/(mean(ds$house_count)*100)
freq_dist_table = table(cut(ds$house_count,breaks = breaks, right = FALSE))


graph = hist( ds$house_count,  
                main = "Sewage Network Expansion - Region X", 
                xlab = "House Count", 
                ylab = "Squares", 
                ylim = c(0,18),
                col = c("aquamarine", "azure", "cyan", "cornsilk", "coral","darkorange"), 
                breaks = breaks,

)

axis(1, at=seq(inferior_lim,upper_lim,h))
axis(2, at=seq(0,max_value,2))
text(graph$mids, graph$counts, labels = graph$counts, adj = c(0.5, -0.5))

freq_dist_table
summary(ds)
average
median
fashion
quartile[1]
quartile[3]
amplitude
variance
standard_deviation
variation_coeff



