#Read data from file
data <- read.csv("household_power_consumption.txt", sep=';')

#filter dates
filtered_data<-subset(data, Date == '2/2/2007' | Date == '1/2/2007')


#create timestamp variable
filtered_data$timestamp <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), 
                                    format="%d/%m/%Y %H:%M:%S")

#assign data to variables
filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
filtered_data$Sub_metering_3 <- as.numeric(as.character(filtered_data$Sub_metering_3))

#initial plot
plot(filtered_data$timestamp, filtered_data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

#add additional lines
lines(filtered_data$timestamp, filtered_data$Sub_metering_2, type="l", col="blue")
lines(filtered_data$timestamp, filtered_data$Sub_metering_3, type="l", col="red")

#add legend
legend("topright", lty=1, lwd=2.5, col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

#copy to .png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()