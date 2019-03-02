library(Cairo)
Cairo(file="generated/graphs/bar-group-usages.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(693, 485, 379, 121, 42, 13)
lbls <- c("Games", "Applications", "Web", "Software Libraries", "Art", "Other")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What do you use Haxe for?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
