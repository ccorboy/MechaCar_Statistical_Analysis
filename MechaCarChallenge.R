### Challenge 15


## Deliverable 1: Linear Regression to Predict MPG

#Load the dplyr package
library(dplyr)

# Import and read in the csv
mecha_car <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression on the mecha_car data
lm_mecha <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car)

# Use summary() to determine p-value and r-squared value for linear regression model
summary(lm_mecha)


## Deliverable 2: Create Visualizations for the Trip Analysis

# Import and read Suspension_Coil.csv
suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create a total_summary df to get summary stats 
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), Num_Coil=n(), .groups='keep') 

# Create a lot_summary df to group stats
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), Num_Coil=n(), .groups='keep')


## Deliverable 3: 

# Use t.test() function to determine is the PSI for all manufacturing lots is statistically different than that of the population mean
# Pop mean = 1500
t.test(suspension_coil$PSI,mu=1500)

# Use t.test() function for each lot
# Create variables for each lot
lot1 <- subset(suspension_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_coil, Manufacturing_Lot=="Lot3")

# t.test for lot 1
t.test(lot1$PSI,mu=1500)

# t.test for lot 2
t.test(lot2$PSI,mu=1500)

# t.test for lot 3
t.test(lot3$PSI,mu=1500)


