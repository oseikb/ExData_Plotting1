library(sqldf)
hpc <- read.csv.sql("./exdata/household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(hpc$DateTime, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "DateTime")

plot(hpc$DateTime, hpc$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "")
points(hpc$DateTime,hpc$Sub_metering_1, type = "l", col = "black")
points(hpc$DateTime,hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$DateTime,hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 0.5, bty = "n",  col = c("black","red", "blue"))

plot(hpc$DateTime, hpc$Global_reactive_power, type = "l", ylab = "Global_Reactive_Power", xlab = "DateTime")