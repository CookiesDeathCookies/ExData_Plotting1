create_second_plot <- function() {
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
      png("plot2.png")
      # --------------- Second plot -------------------
      plot(data$DateTime, data$Global_active_power, 
           type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
      
      dev.off()
}