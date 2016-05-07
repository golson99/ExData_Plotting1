#Read data from file
data <- read.csv("household_power_consumption.txt", sep=';')

#filter dates
filtered_data<-subset(data, Date == '2/2/2007' | Date == '1/2/2007')

filtered_data$timestamp <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), 
                                    format="%d/%m/%Y %H:%M:%S")


#assign data to variables
filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))
filtered_data$Global_voltage <- as.numeric(as.character(filtered_data$Voltage))
filtered_data$Global_reactive_power <- as.numeric(as.character(filtered_data$Global_reactive_power))
filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
filtered_data$Sub_metering_3 <- as.numeric(as.character(filtered_data$Sub_metering_3))

#set layout parameter
par(mfrow=c(2,2))

#plot upper left
plot(filtered_data$timestamp, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot upper right
plot(filtered_data$timestamp, filtered_data$Voltage, type="l", xlab="", ylab="Voltage")


#plot lower left
plot(filtered_data$timestamp, filtered_data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(filtered_data$timestamp, filtered_data$Sub_metering_2, type="l", col="blue")
lines(filtered_data$timestamp, filtered_data$Sub_metering_3, type="l", col="red")
legend("topright",cex =.2,bty = 'n',lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot lower right
plot(filtered_data$timestamp, filtered_data$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")


#copy to .png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()