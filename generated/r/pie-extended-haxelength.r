library(Cairo)
Cairo(file="generated/graphs/pie-extended-haxelength.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(136, 106, 95, 76, 30, 27)
lbls <- c("< 1 year", "2-4 years", "1-2 years", "4-6 years", "6-8 years", "> 8 years")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="How long have you been using Haxe?")
invisible(dev.off())