
library(sqldf)
if (!file.exists("household_power_consumption.txt")) {
  print("Cannot find file")
} else {
  ## read in data and merge date and time
  data <- read.csv.sql("household_power_consumption.txt", sql='select * from file where Date= "1/2/2007" or Date="2/2/2007"',sep=";")
  data$dt <- paste(data$Date, data$Time, sep=" ")
  data$datet <- strptime(data$dt, "%d/%m/%Y %H:%M:%S")
  
  ## plot a histogram of Global active power for the two days
  png("plot1.png", width=480, height=480)
  with(data, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power"))
  dev.off()
}