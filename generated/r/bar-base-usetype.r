library(Cairo)
Cairo(file="generated/graphs/bar-base-usetype.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(254, 151, 131, 67)
lbls <- c("For hobby projects", "Main professional tool", "I don't yet use Haxe", "Occasional professional tool")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What do you use Haxe for?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
