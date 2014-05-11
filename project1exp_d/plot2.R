png("plot2.png", width = 480, height = 480)

## Capture the required rows
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")
## Convert Date,Time to" "POSIXt" class
x<-paste(myData$Date,myData$Time)
gap <- myData$Global_active_power
x<- strptime(x,"%d/%m/%Y %H:%M:%S")
plot(x,gap,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(x,gap)
#Create png
dev.off()