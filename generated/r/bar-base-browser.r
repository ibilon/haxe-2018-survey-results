library(Cairo)
Cairo(file="generated/graphs/bar-base-browser.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(326, 209, 21, 14, 14, 8, 1)
lbls <- c("Chrome", "Firefox", "Safari", "Other", "Opera", "Edge", "Internet Explorer")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your primary web browser?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
