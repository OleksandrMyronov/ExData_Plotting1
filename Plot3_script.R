library(dplyr)

read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>%
filter((Date=="1/2/2007") | (Date=="2/2/2007")) %>%
mutate(Time=strptime(paste(Date, Time), format = "%e/%m/%Y %H:%M:%S"), Date=NULL) -> powercons
  
with(powercons,  {plot(Time,  Sub_metering_1, col="black", type="l", xlab= "", ylab="Energy sub metering")
                 lines(Time,  Sub_metering_2, col="red")
                 lines(Time,  Sub_metering_3, col="blue")
                 })
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=colnames(powercons)[6:8])
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
