source("common.R")

plot2 <- function(dataset, ylabel = "Global Active Power (kilowatts)") {
        plot(dataset$datetime, dataset$Global_active_power,
             ylab = ylabel, xlab = "", type = "l")
}

make_plot2 <- function() {
        make_plot(plot2, 2)
}