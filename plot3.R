plot3 <- function(directory) {
  ## Plots Week 1
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV file
  
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  
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

plot(plotList, as.numeric(sel[,7]), pch = ".",  xaxt = "n",
     xlab = "", ylab = "Energy Sub metering")
axis(1, at = seq(0,2880, by =1440), labels = c("Thu", "Fri", "Sat"))
lines(plotList, as.numeric(sel[,7]))
points(plotList, as.numeric(sel[,8]), pch = ".", col = "red")
lines(plotList, as.numeric(sel[,8]), col = "red")
points(plotList, as.numeric(sel[,9]), pch = ".", col = "blue")
lines(plotList, as.numeric(sel[,9]), col = "blue")
legend("topright", col = c("black","red","blue"), lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
}

