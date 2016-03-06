create_first_plot <- function() {
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
      png("plot1.png")
      # --------------- First plot -------------------
      hist(data$Global_active_power, col = "red", main = "Global Active Power", 
           ylim = c(0, 1200), xlim = c(0, 6),
                  xlab = "Global Active Power (kilowatts)", 
                        ylab = "Frequncy")
      
      dev.off()
}
      