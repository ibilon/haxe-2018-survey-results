library(Cairo)
Cairo(file="generated/graphs/bar-base-country.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(104, 57, 44, 39, 37, 17, 16, 16, 14, 13, 13, 12, 11, 10, 9, 8, 8, 7, 7, 7, 6, 6, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
lbls <- c("United States", "France", "Russia", "Germany", "United Kingdom", "Australia", "Canada", "Brazil", "Japan", "Ukraine", "Spain", "Netherlands", "Italy", "Belgium", "India", "South Africa", "Poland", "Belarus", "Austria", "Argentina", "Sweden", "Denmark", "Czech Republic", "Mexico", "South Korea", "Norway", "Bulgaria", "Hungary", "Colombia", "Switzerland", "Luxembourg", "Indonesia", "Philippines", "Finland", "China", "Slovakia", "Romania", "Hong Kong", "Bangladesh", "Portugal", "Israel", "Moldova", "Georgia", "Slovenia", "Libya", "Guatemala", "Turkey", "New Zealand", "United Arab Emirates", "Bosnia and Herzegovina", "Ireland", "Greece", "Syria", "Egypt", "Iran", "Saudi Arabia", "Puerto Rico", "Nigeria", "Faroe Islands", "Vietnam", "Azerbaijan", "Aruba", "Latvia")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Where are you geographically located?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
