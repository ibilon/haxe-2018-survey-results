library(Cairo)
Cairo(file="generated/graphs/bar-base-partner.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(565, 12)
lbls <- c("No", "Yes")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Are you currently a Haxe Foundation support partner?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
