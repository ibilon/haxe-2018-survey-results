library(Cairo)
Cairo(file="generated/graphs/pie-base-mobileos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(438, 119, 11, 11, 3)
lbls <- c("Android", "iOS", "Windows Phone", "Other", "Blackberry")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="What is your mobile operating system?")
invisible(dev.off())