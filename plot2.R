#Read data from file
data <- read.csv("household_power_consumption.txt", sep=';')

#filter dates
filtered_data<-subset(data, Date == '2/2/2007' | Date == '1/2/2007')

#assign global active power data to variable
filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))

#create timestamp variable
filtered_data$timestamp <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#plot the graph
plot(filtered_data$timestamp, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#copy to .png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()