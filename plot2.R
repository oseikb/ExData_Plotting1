library(sqldf)
hpc <- read.csv.sql("./exdata/household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
