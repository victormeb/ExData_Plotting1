plot2 <- function(directory) {
  ## Plots Week 1
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV file
  
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  
  elec_pow_con_data <- read.csv(
    paste(directory,"/","household_power_consumption.txt",sep = ""), 
    header = TRUE, stringsAsFactor = FALSE, sep = ";", dec = ".", fill = TRUE)
  head(elec_pow_con_data)
  
    idList = 1:nrow(elec_pow_con_data)

  sel <- elec_pow_con_data[0,]
for(id in idList) {
  if(elec_pow_con_data[id,1]=="1/2/2007") { 
    sel <- rbind(sel, elec_pow_con_data[id,])
  }
}

for(id in idList) {
  if(elec_pow_con_data[id,1]=="2/2/2007") { 
    sel <- rbind(sel, elec_pow_con_data[id,])
  }
}

plotList = c(1:nrow(sel))
active_power_plot <- as.numeric(sel[,3])

plot(plotList, active_power_plot, pch = ".", xaxt = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = seq(0,2880, by =1440), labels = c("Thu", "Fri", "Sat"))
lines(plotList, active_power_plot)

dev.off()
}

