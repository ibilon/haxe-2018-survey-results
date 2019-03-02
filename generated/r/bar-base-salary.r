library(Cairo)
Cairo(file="generated/graphs/bar-base-salary.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(184, 175, 76, 51, 46, 24, 11)
lbls <- c("I'd rather not say", "< $30,000", "$30,000-$50,000", "$70,001-$100,000", "$50,001-$70,000", "$100,001-$150,000", ">$150,000")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your annual salary (U.S. Dollars)?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
