plot1 <- function(directory) {
  ## Plots Week 1
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV file
  
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
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

 data_plot <- as.numeric(sel[,3])
 hist(data_plot, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
}

