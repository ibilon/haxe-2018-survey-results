library(Cairo)
Cairo(file="generated/graphs/pie-base-desktopos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(316, 158, 111, 6)
lbls <- c("Windows", "Linux", "OSX", "Other")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="What is your primary desktop operating system?")
invisible(dev.off())