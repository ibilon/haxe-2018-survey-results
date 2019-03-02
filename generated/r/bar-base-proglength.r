library(Cairo)
Cairo(file="generated/graphs/bar-base-proglength.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(153, 131, 125, 109, 84)
lbls <- c("> 15 years", "7-10 years", "10-15 years", "3-5 years", "1-3 years")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How long have you been programming?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
