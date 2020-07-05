#setting the directory where I copied the txt file
setwd("D:/")

power_data_table <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
power_data_table[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power_data_table[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates between 2007-02-01 and2007-02-02
power_data_table <- power_data_table[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

par(mfrow=c(2,2))
#1
plot(power_data_table[, dateTime], power_data_table[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
#2
plot(power_data_table[, dateTime],power_data_table[, Voltage], type="l", xlab="datetime", ylab="Voltage")
#3
plot(power_data_table[, dateTime], power_data_table[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_data_table[, dateTime], power_data_table[, Sub_metering_2], col="red")
lines(power_data_table[, dateTime], power_data_table[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
#4
plot(power_data_table[, dateTime], power_data_table[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

