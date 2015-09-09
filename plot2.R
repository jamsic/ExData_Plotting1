setwd("/home/jamsic/coursera/ExploratoryDataAnalysis/week1/CourseProject")

filename <- "household_power_consumption.txt"
dates <- c("1/2/2007","2/2/2007")

totaldata <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
neededdates <- totaldata$Date %in% dates
Data <- totaldata[neededdates,]

datetime <- strptime(paste(Data$Date, Data$Time, sep="/"), format = "%d/%m/%Y/%H:%M:%S")

png(file = "plot2.png", width=480, height=480) 
plot(datetime, Data$Global_active_power, type = "l", xlab = "", ylab="Global active power (kilowatts)")
dev.off()
