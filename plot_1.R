#setting the directory where I copied the txt file
setwd("D:/")

power_data_table <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

power_data_table[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power_data_table[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# filtering the rows with date in between 01/02/2002 to 02/02/2002
power_data_table <- power_data_table[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

hist(power_data_table[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

