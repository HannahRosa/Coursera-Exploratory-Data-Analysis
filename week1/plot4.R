#Open File
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings = "?")

# Paste date and time toghether - turn factor into date & time class 
datetime <- paste(household_power_consumption$Date, household_power_consumption$Time)
datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

# bind datetime and household_power_consumption
household_power_consumption <- cbind(datetime, household_power_consumption)

# Creating a subset for 1st and 2nd of Feb 2007
household_power_consumption2 <- subset(x = household_power_consumption, subset = Date == "2007-02-01" | Date == "2007-02-02")

### PLOT 4
png("plot4.png")
par(mfrow = c(2, 2))
par(mar = c(2, 4, 2, 1))
plot(household_power_consumption2$datetime, household_power_consumption2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(household_power_consumption2$datetime, household_power_consumption2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(household_power_consumption2$datetime, household_power_consumption2$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(household_power_consumption2$datetime, household_power_consumption2$Sub_metering_2, type = "l", xlab = " ", ylab = "Energy sub metering", col ="red")
points(household_power_consumption2$datetime, household_power_consumption2$Sub_metering_3, type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(household_power_consumption2$datetime, household_power_consumption2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0,0.5))
dev.off()