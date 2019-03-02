library(Cairo)
Cairo(file="generated/graphs/bar-base-communication.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(257, 148, 113, 64, 36, 13)
lbls <- c("Official
Forum", "Twitter", "Other", "Gitter.im", "#haxe on irc", "Facebook")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you communicate with other Haxe users?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
