library(Cairo)
Cairo(file="generated/graphs/bar-extended-desktopos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(316, 158, 111, 5, 1)
lbls <- c("Windows", "Linux", "OSX", "Multiple", "Other")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your primary desktop operating system?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
