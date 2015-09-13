## General subsetting of data


DataSet <- read.table("./ExData_Plotting1/exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?"), stringsAsFactors = FALSE)


#subset to dates 2007-02-01 and 2007-02-02
DataSet$Date <- as.Date(DataSet$Date, "%d/%m/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

newData <- DataSet[which(DataSet$Date >= startDate & DataSet$Date <= endDate),]

newData$Date <- as.character(newData$Date)
newCol <- paste(newData$Date, newData$Time)
SubData <- cbind(newData, newCol)
Names <- c(colnames(newData), "DateTime")
colnames(SubData) <- Names
SubData$DateTime <- ymd_hms(SubData$DateTime)

## Plot 2 

png("plot2.png")
attach(SubData)
plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
detach(SubData)
dev.off()

