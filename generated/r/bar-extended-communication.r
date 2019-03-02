library(Cairo)
Cairo(file="generated/graphs/bar-extended-communication.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(257, 148, 64, 36, 34, 18, 14, 13, 12, 7, 6, 5, 4, 3, 2, 2, 2, 2, 1, 1)
lbls <- c("Official
Forum", "Twitter", "Gitter.im", "#haxe on irc", "Discord", "None", "Slack", "Facebook", "Telegram", "Openfl's Forum", "Github", "StackOverflow", "Skype", "Reddit", "Email", "Other", "Other Forum", "Youtube", "QQ", "Google Groups")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you communicate with other Haxe users?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
