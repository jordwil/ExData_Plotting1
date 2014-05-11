png("plot3.png", width = 480, height = 480)
## Capture the required rows

require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

## Convert Date,Time to" "POSIXt" class
x<-paste(myData$Date,myData$Time)
x<- strptime(x,"%d/%m/%Y %H:%M:%S")

plot(x,myData$Sub_metering_1, xlab="",ylab="Energy sub metering",type="n")
lines(x,myData$Sub_metering_1)
lines(x,myData$Sub_metering_2,col="red")
lines(x,myData$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1),  col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Create png
dev.off()