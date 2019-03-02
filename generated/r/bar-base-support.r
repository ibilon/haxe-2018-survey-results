library(Cairo)
Cairo(file="generated/graphs/bar-base-support.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(274, 174, 39, 18, 6, 6, 5, 0)
lbls <- c("$1-$100", "Nothing", "$101-$500", "$501-$1000", ">$100,000", "$5001-$20,000", "$1001-$5000", "$20,001-$100,000")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How much would you be willing to give to the Haxe Foundation to support them financially (U.S. Dollars)?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
