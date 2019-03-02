library(Cairo)
Cairo(file="generated/graphs/bar-extended-usages.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(339, 274, 238, 188, 160, 141, 135, 121, 66, 42, 14, 8, 4, 2, 1, 1)
lbls <- c("Desktop
Games", "Mobile
Games", "Frontend
Web", "Desktop
Apps", "CLI", "Backend
Web", "Mobile
App", "Software
Libraries", "Console
Games", "Art", "Web Games", "Other", "Education", "Data Processing", "Prototyping", "Not Applicable")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What do you use Haxe for?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
