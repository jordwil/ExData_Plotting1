png("plot1.png", width = 480, height = 480)
## Capture the required rows
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

#Create Hist
Pic1 <- hist(myData$Global_active_power,c="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
Pic1

#Create png
dev.off()


