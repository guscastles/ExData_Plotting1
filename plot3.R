source("common.R")

plot3 <- function(dataset) {
        datetime_range <- create_datetime_range(dataset)
        plot(datetime_range, dataset$Sub_metering_1, type = "n", xaxt = "n",
             ylab = "Enery sub metering", xlab = "")
        lines(datetime_range, dataset$Sub_metering_1, type = "l")
        lines(datetime_range, dataset$Sub_metering_2, type = "l", col = "red")
        lines(datetime_range, dataset$Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = c(1, 1, 1))
        create_axis(dataset)
}

make_plot3 <- function() {
        make_plot(plot3, 3)
}