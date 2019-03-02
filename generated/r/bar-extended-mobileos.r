library(Cairo)
Cairo(file="generated/graphs/bar-extended-mobileos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(438, 119, 11, 7, 3, 2, 1, 1)
lbls <- c("Android", "iOS", "Windows Phone", "Not Applicable", "Blackberry", "Other", "Linux", "Multiple")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your mobile operating system?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
