source("common.R")

plot2 <- function(dataset, ylabel = "Global Active Power (kilowatts)") {
        datetime_range <- create_datetime_range(dataset)
        plot(datetime_range, dataset$Global_active_power, type = "n", xaxt = "n",
             ylab = ylabel, xlab = "")
        lines(datetime_range, dataset$Global_active_power, type = "l")
        create_axis(dataset)
}

make_plot2 <- function() {
        make_plot(plot2, 2)
}