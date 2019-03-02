library(Cairo)
Cairo(file="generated/graphs/pie-extended-communication.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(257, 148, 64, 36, 34, 18, 14, 13, 12, 7, 6, 5, 4, 3, 2, 2, 2, 2, 1, 1)
lbls <- c("Official
Forum", "Twitter", "Gitter.im", "#haxe on irc", "Discord", "None", "Slack", "Facebook", "Telegram", "Openfl's Forum", "Github", "StackOverflow", "Skype", "Reddit", "Email", "Other", "Other Forum", "Youtube", "QQ", "Google Groups")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="How do you communicate with other Haxe users?")
invisible(dev.off())