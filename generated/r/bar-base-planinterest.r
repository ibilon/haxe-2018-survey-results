library(Cairo)
Cairo(file="generated/graphs/bar-base-planinterest.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(451, 38, 20, 6, 5)
lbls <- c("Free", "Professional", "Other", "Enterprise", "Elite")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Which of the following support plans would you be interested in?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
