origin <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
origin$Date <- as.Date(origin$Date, format="%d/%m/%Y")


work_data <- subset(origin, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(origin)

datetime <- paste(as.Date(work_data$Date), work_data$Time)
work_data$Datetime <- as.POSIXct(datetime)


hist(work_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

