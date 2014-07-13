
origin <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
origin$Date <- as.Date(origin$Date, format="%d/%m/%Y")


work_data <- subset(origin, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(origin)


datetime <- paste(as.Date(work_data$Date), work_data$Time)
work_data$Datetime <- as.POSIXct(datetime)

with(work_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()