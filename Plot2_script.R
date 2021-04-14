library(dplyr)

read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>%
filter((Date=="1/2/2007") | (Date=="2/2/2007")) %>%
mutate(Time=strptime(paste(Date, Time), format = "%e/%m/%Y %H:%M:%S"), Date=NULL) -> powercons

with(powercons,  plot(Time,  Global_active_power, type="l",
      xlab= "", ylab="Global Active Power (kiloWatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()