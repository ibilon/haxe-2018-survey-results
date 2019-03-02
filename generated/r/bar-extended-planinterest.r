library(Cairo)
Cairo(file="generated/graphs/bar-extended-planinterest.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(38, 6, 5, 4, 3, 2, 2)
lbls <- c("Professional", "Enterprise", "Elite", "Bounty", "If I Could", "Individual", "Paid")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Which of the following support plans would you be interested in?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
