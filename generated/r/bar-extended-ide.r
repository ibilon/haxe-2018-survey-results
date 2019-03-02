library(Cairo)
Cairo(file="generated/graphs/bar-extended-ide.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(223, 110, 58, 41, 31, 19, 9, 6, 4, 3, 2, 2, 1, 1)
lbls <- c("Visual Studio Code", "FlashDevelop/HaxeDevelop", "IntelliJ", "Sublime Text", "VIM", "Atom", "Emacs", "Kode Studio", "None", "Geany", "Multiple", "Notepad++", "TextMate", "Web Based")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your preferred Haxe IDE?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
