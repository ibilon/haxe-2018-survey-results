library(Cairo)
Cairo(file="generated/graphs/bar-base-macros.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(246, 221, 107)
lbls <- c("Yes", "No", "What's a macro?")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Do you use macros?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
