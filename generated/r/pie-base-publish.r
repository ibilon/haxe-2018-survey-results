library(Cairo)
Cairo(file="generated/graphs/pie-base-publish.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(314, 144, 102, 99, 74, 58, 16, 16, 12, 12, 11, 11, 10, 4)
lbls <- c("The Web", "Android
Store", "itch.io", "iOS
Store", "Other", "Steam", "Amazon
Store", "Mac
Store", "Nintendo
Switch", "PS4", "GOG.com", "Xbox One", "Windows
Store", "PSVita")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="Where do you publish your Haxe applications?")
invisible(dev.off())
