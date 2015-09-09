setwd("/home/jamsic/coursera/ExploratoryDataAnalysis/week1/CourseProject")

filename <- "household_power_consumption.txt"
dates <- c("1/2/2007","2/2/2007")

totaldata <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
neededdates <- totaldata$Date %in% dates
data <- totaldata[neededdates,]

png(file = "plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red",
     xlab = "Global active power (kilowatts)",
     main = "Global Active Power")
dev.off()
