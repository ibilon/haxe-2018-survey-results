library(Cairo)
Cairo(file="generated/graphs/bar-base-targets.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(419, 337, 178, 160, 100, 87, 84, 81, 77, 73, 32, 20)
lbls <- c("JavaScript", "C++", "Neko", "Flash", "Java", "Python", "HashLink", "C#", "PHP", "--interp", "Lua", "AS3")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Which Haxe targets do you use?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
