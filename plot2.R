library(sqldf)

if (!file.exists("household_power_consumption.txt")) {
  print("Cannot find file")
} else {
  ## read in data and merge time and date
  data <- read.csv.sql("household_power_consumption.txt", sql='select * from file where Date= "1/2/2007" or Date="2/2/2007"',sep=";")
  data$dt <- paste(data$Date, data$Time, sep=" ")
  data$datet <- strptime(data$dt, "%d/%m/%Y %H:%M:%S")
  
  ## plot Global Active Power over time
  attach(data)
  png("plot2.png", width=480, height=480)
    plot(datet, Global_active_power, type="n", main="",ylab="Global Active Power (kilowatts)",xlab="")
    lines(datet, Global_active_power)
  dev.off()
}