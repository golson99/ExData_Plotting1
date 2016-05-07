#Read data from file
data <- read.csv("household_power_consumption.txt", sep=';')

#filter dates
filtered_data<-subset(data, Date == '2/2/2007' | Date == '1/2/2007')

#assign global active power data to variable
filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))

#plot histogram
hist(filtered_data$Global_active_power,main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#copy to .png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()