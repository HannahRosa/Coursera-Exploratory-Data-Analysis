#Open File
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings = "?")

# Convert factor to date class and time class
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

# Subset time period: 1st and 2nd of February 2007
household_power_consumption2 <- subset(x = household_power_consumption, subset = Date == "2007-02-01" | Date == "2007-02-02")

### PLOT 1
# Histogram

png("plot1.png")
hist(household_power_consumption2$Global_active_power, main="Global active power", col = "red", xlab = "Global active power (kilowatts)")
dev.off()