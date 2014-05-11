png("plot4.png", width = 480, height = 480)
## Capture the required rows

require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

## Convert Date,Time to" "POSIXt" class
x<-paste(myData$Date,myData$Time)
myData$Time <- strptime(x,"%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
with(myData,{
  plot(Time,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
  lines(Time,Global_active_power)
  plot(Time,Voltage,xlab="datetime",type="n")
  lines(Time,Voltage)
  plot(Time,Sub_metering_1, xlab="",ylab="Energy sub metering",type="n")
  lines(Time,Sub_metering_1)
  lines(Time,Sub_metering_2,col="red")
  lines(Time,Sub_metering_3, col="blue")
  legend("topright",lty=c(1,1), bty="n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(Time,Global_reactive_power,xlab="datetime",type="n")
  lines(Time,Global_reactive_power)
})
dev.off()