# Plot1 for household_power_consumption
# To plot frequency of Global Active Power for 2007-02-01 and 2007-02-02.

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

# Plot histogram with frequency of Global Active Power
# and save as plot1.png
png("plot1.png", width = 480, height = 480, units = "px")
hist(filteredData$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()