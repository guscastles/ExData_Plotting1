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
        datetime_range <- create_datetime_range(dataset)
        plot(datetime_range, dataset$Voltage, type = "n", xaxt = "n",
             ylab = "Voltage", xlab = "datetime")
        lines(datetime_range, dataset$Voltage, type = "l")
        create_axis(dataset)
}

plot4b <- function(dataset) {
        datetime_range <- create_datetime_range(dataset)
        plot(datetime_range, dataset$Global_reactive_power, type = "n", xaxt = "n",
             xlab = "datetime", ylab = "Global_reactive_power")
        lines(datetime_range, dataset$Global_reactive_power, type = "l")
        create_axis(dataset)
}

make_plot4 <- function() {
        make_plot(plot4, 4)
}
