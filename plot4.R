setwd("/home/jamsic/coursera/ExploratoryDataAnalysis/week1/CourseProject")

filename <- "household_power_consumption.txt"
dates <- c("1/2/2007","2/2/2007")

totaldata <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
neededdates <- totaldata$Date %in% dates
Data <- totaldata[neededdates,]

datetime <- strptime(paste(Data$Date, Data$Time, sep="/"), format = "%d/%m/%Y/%H:%M:%S")

png(file = "plot4.png", width=480, height=480)
par(mfcol = c(2,2))
with(Data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab="Global active power"))
with(Data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(Data, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(Data, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border = "white", bty = "n")
with(Data, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(Data, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
