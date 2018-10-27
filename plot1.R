source("common.R")

plot1 <- function(dataset) {
        hist(dataset$Global_active_power,
             col = "red",
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
}

make_plot1 <- function() {
        make_plot(plot1, 1)
}