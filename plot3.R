#Read data 
electric_power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';',
                                  na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


#data prep
##Make Date column a Date Data Type 
electric_power_data$Date <- as.Date(electric_power_data$Date, "%d/%m/%Y")
##Subset for the days 2007-02-01 and 2007-02-02
electric_power_data<- electric_power_data[(electric_power_data$Date == "2007-02-01" | electric_power_data$Date == "2007-02-02"),]
##Combine date and time column
electric_power_data$DateTime <- paste(electric_power_data$Date, electric_power_data$Time)
##Convert DateTime column to Date and Time data type
electric_power_data$DateTime <- strptime(electric_power_data$DateTime,"%Y-%m-%d %H:%M:%S")

#plot 3
par(pty = "s")
plot(electric_power_data$DateTime, electric_power_data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub meeting", )
lines(electric_power_data$DateTime, electric_power_data$Sub_metering_2, type = "l", col = "red")
lines(electric_power_data$DateTime, electric_power_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save file and close device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()