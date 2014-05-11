# Plot2 for household_power_consumption
# To plot Global Active Power trend during 2007-02-01 and 2007-02-02.

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

# Plot Global Active Power trend during 2007-02-01 and 2007-02-02.
# and save as plot2.png
png("plot2.png", width = 480, height = 480, units = "px")
plot(filteredData$DateTime,
     filteredData$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     pch="")
lines(filteredData$DateTime,
      filteredData$Global_active_power,
      lwd=1)
dev.off()

