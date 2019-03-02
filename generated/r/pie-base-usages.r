library(Cairo)
Cairo(file="generated/graphs/pie-base-usages.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(339, 274, 238, 188, 160, 141, 135, 121, 66, 42, 30)
lbls <- c("Desktop
Games", "Mobile
Games", "Frontend
Web", "Desktop
Apps", "CLI", "Backend
Web", "Mobile
App", "Software
Libraries", "Console
Games", "Art", "Other")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="What do you use Haxe for?")
invisible(dev.off())
