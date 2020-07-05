#setting the directory where I copied the txt file
setwd("D:/")

power_data_table <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
power_data_table[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power_data_table[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates between 2007-02-01 and2007-02-02
power_data_table <- power_data_table[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

plot(x = power_data_table[, dateTime], y = power_data_table[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")