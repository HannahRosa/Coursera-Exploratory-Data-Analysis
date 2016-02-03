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

### PLOT 2

png("plot2.png")
plot(household_power_consumption2$datetime, household_power_consumption2$Global_active_power, type = "l", xlab=" ", ylab="Global active power (kilowatts)")
dev.off()

