table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")



table$Date <- as.Date(table$Date, "%d/%m/%Y")
subsetTable <- table[ which(table$Date=='2007-02-01' | table$Date=='2007-02-02'),]



subsetTable$Time <- as.character(subsetTable$Time)
dateTime <- paste(subsetTable$Date,subsetTable$Time)
Ts <- as.POSIXlt(c(dateTime))



png("plot2.png", width = 480, height = 480)



subsetTable$Global_active_power <- as.numeric(as.character(subsetTable$Global_active_power))
subsetTable$Global_active_power [subsetTable$Global_active_power =='?'] <- NA
plot(Ts,subsetTable$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(Ts,subsetTable$Global_active_power)

dev.off()