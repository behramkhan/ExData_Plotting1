table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")



table$Date <- as.Date(table$Date, "%d/%m/%Y")
subsetTable <- table[ which(table$Date=='2007-02-01' | table$Date=='2007-02-02'),]



subsetTable$Time <- as.character(subsetTable$Time)
dateTime <- paste(subsetTable$Date,subsetTable$Time)
Ts <- as.POSIXlt(c(dateTime))




png("plot3.png", width = 480, height = 480)



subsetTable$Sub_metering_1 <- as.numeric(as.character(subsetTable$Sub_metering_1))
subsetTable$Sub_metering_2 <- as.numeric(as.character(subsetTable$Sub_metering_2))
subsetTable$Sub_metering_3 <- as.numeric(as.character(subsetTable$Sub_metering_3))
subsetTable$Sub_metering_1 [subsetTable$Sub_metering_1 =='?'] <- NA
subsetTable$Sub_metering_2 [subsetTable$Sub_metering_2 =='?'] <- NA
subsetTable$Sub_metering_3 [subsetTable$Sub_metering_3 =='?'] <- NA
plot(Ts,subsetTable$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(Ts,subsetTable$Sub_metering_1, col = "Black")
lines(Ts,subsetTable$Sub_metering_2, col = "Red")
lines(Ts,subsetTable$Sub_metering_3, col = "Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "__", col = c("Black", "Red","blue"))



dev.off()