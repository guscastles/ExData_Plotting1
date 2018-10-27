source("common.R")

plot3 <- function(dataset) {
        nrows <- dim(dataset)[1]
        hour_range <- 1:nrows
        plot(hour_range, dataset$Sub_metering_1, type = "n", xaxt = "n",
             ylab = "Enery sub metering", xlab = "")
        lines(hour_range, dataset$Sub_metering_1, type = "l")
        lines(hour_range, dataset$Sub_metering_2, type = "l", col = "red")
        lines(hour_range, dataset$Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = c(1, 1, 1))
        axis(1, at = c(1, floor(nrows / 2), nrows), tick = TRUE,
             labels = create_labels(as.Date(dataset$Date)))
}

make_plot3 <- function() {
        png(file = "plot3.png", width = 480, height = 480)
        plot3(fetch_data())
        dev.off()
}