create_fourth_plot <- function() {
      # --------------- loading required libraries and files -------------------
      library(dplyr)
      library(tidyr)
      library(lubridate)
      
      package_name <- "exdata-data-household_power_consumption"
      file_name <- "household_power_consumption.txt"
      
      setwd(package_name)
      data <- read.table("household_power_consumption.txt",
                         header = TRUE, sep = ";", na.strings = "?")
      data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
      data <- mutate(data, DateTime = dmy_hms(paste(Date, " ", Time)))
      
      setwd("..")
      png("plot4.png")
      # --------------- Setting layour parameters -------------------
      par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
      
      # --------------- First plot -------------------
      plot(data$DateTime, data$Global_active_power, 
           type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
      
      # --------------- Second plot -------------------
      plot(data$DateTime, data$Voltage, type = "l", 
           xlab = "datetime", ylab = "Voltage")
      
      # --------------- Third plot -------------------
      plot(data$DateTime, data$Sub_metering_1, type = "n",
           xlab = "", ylab = "Energy sub metering")
      lines(data$DateTime, data$Sub_metering_1, col = "black")
      lines(data$DateTime, data$Sub_metering_2, col = "red")
      lines(data$DateTime, data$Sub_metering_3, col = "blue")
      
      legend("topright", lty = c(1, 1), 
             col = c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      # --------------- Fourth plot -------------------
      plot(data$DateTime, data$Global_reactive_power, type = "l",
           xlab = "datetime", ylab = "Global_reactive_power")
      
      dev.off()
}