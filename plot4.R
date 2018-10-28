source("plot2.R")
source("plot3.R")

plot4 <- function(dataset) {
        par(mfcol = c(2, 2))
        plot2(dataset, ylabel = "Global Active Power")
        plot3(dataset)
        plot4a(dataset)
        plot4b(dataset)
}

plot4a <- function(dataset) {
        with(dataset, plot(datetime, Voltage, type = "l",
                           ylab = "Voltage", xlab = "datetime"))
}

plot4b <- function(dataset) {
        with(dataset, plot(datetime, Global_reactive_power, type = "l",
                           xlab = "datetime", ylab = "Global_reactive_power"))
}

make_plot4 <- function() {
        make_plot(plot4, 4)
}
