library(dplyr)

read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>%
filter((Date=="1/2/2007") | (Date=="2/2/2007")) -> powercons

hist(powercons$Global_active_power, breaks=12, col = "red", 
     main="Global Active Power", xlab="Global Active Power (kiloWatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()