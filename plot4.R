## General subsetting of data


DataSet <- read.table("./ExData_Plotting1/exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?"), stringsAsFactors = FALSE)


#subset to dates 2007-02-01 and 2007-02-02
DataSet$Date <- as.Date(DataSet$Date, "%d/%m/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

newData <- DataSet[which(DataSet$Date >= startDate & DataSet$Date <= 
                           endDate),]

newData$Date <- as.character(newData$Date)
newCol <- paste(newData$Date, newData$Time)
SubData <- cbind(newData, newCol)
Names <- c(colnames(newData), "DateTime")
colnames(SubData) <- Names
SubData$DateTime <- ymd_hms(SubData$DateTime)

## Plot 4 

png("plot4.png")

par(mfrow=c(2,2))

plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l")
lines(DateTime, Sub_metering_2, xlab = "", col = "red", type = "l")
lines(DateTime, Sub_metering_3, xlab = "", col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()