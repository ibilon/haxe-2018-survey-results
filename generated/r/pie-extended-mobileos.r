library(Cairo)
Cairo(file="generated/graphs/pie-extended-mobileos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(438, 119, 11, 7, 3, 2, 1, 1)
lbls <- c("Android", "iOS", "Windows Phone", "Not Applicable", "Blackberry", "Other", "Linux", "Multiple")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="What is your mobile operating system?")
invisible(dev.off())
