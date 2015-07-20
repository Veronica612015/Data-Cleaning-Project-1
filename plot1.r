# read in the file using read table and set nrows to reduce memory
power = read.table("household_power_consumption.txt", nrows = 2075259, header=TRUE, sep = ";", quote = "\"", na.string="?")

# convert the data to a date object
power$Date = strptime(power$Date, "%d/%m/%Y")

#use subset to just select Feb 1, 2007 and Feb 2, 2007
powerFeb = subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02" )

#Draw the histogram to the file plot1.png
png(file= "plot1.png", width=480, height = 480)
hist(powerFeb$Global_active_power, main = "Global Active Power",
     col="red", xlab="Global Active Power (kilwatts)")
dev.off()


           