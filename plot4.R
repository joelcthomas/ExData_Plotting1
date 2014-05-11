# Plot4 for household_power_consumption
# To plot multiple plots analyzing energy consumption
# during 2007-02-01 and 2007-02-02.

# Read data from file household_power_consumption.txt
# Ignore "?" as NA
data <- read.table("household_power_consumption.txt", 
                   header = TRUE,
                   sep=";",
                   na.strings=c("?"),
                   colClasses=c("character","character","numeric"
                                ,"numeric","numeric","numeric"
                                ,"numeric","numeric"))

# Format data and time columns
data$DateTime<-as.POSIXlt(paste(data$Date, data$Time), 
                          format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Filter data only for 2007-02-01 and 2007-02-02.
filteredData<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

# Plot multiple plots analyzing energy consumption 2007-02-01 and 2007-02-02.
# and save as plot4.png
png("plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

#Subplot 1
plot(filteredData$DateTime,
     filteredData$Global_active_power,
     xlab="",
     ylab="Global Active Power",
     pch="")
lines(filteredData$DateTime,
      filteredData$Global_active_power,
      lwd=1)

#Subplot 2
plot(filteredData$DateTime,
     filteredData$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     pch="")
lines(filteredData$DateTime,
      filteredData$Sub_metering_1,
      lwd=1,col="black")
lines(filteredData$DateTime,
      filteredData$Sub_metering_2,
      lwd=1,col="red")
lines(filteredData$DateTime,
      filteredData$Sub_metering_3,
      lwd=1,col="blue")
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1,
       bty="n",
       lty=c(1,1))

#Subplot 3
plot(filteredData$DateTime,
     filteredData$Voltage,
     xlab="datetime",
     ylab="Voltage",
     pch="")
lines(filteredData$DateTime,
      filteredData$Voltage,
      lwd=1)

#Subplot 4
plot(filteredData$DateTime,
     filteredData$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     pch="")
lines(filteredData$DateTime,
      filteredData$Global_reactive_power,
      lwd=1)

dev.off()
