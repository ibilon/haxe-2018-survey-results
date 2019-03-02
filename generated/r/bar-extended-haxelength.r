library(Cairo)
Cairo(file="generated/graphs/bar-extended-haxelength.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(136, 106, 95, 76, 30, 27)
lbls <- c("< 1 year", "2-4 years", "1-2 years", "4-6 years", "6-8 years", "> 8 years")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How long have you been using Haxe?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
