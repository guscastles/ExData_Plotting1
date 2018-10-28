source("common.R")

plot3 <- function(dataset) {
        with(dataset, {
             plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
             lines(datetime, Sub_metering_2, type = "l", col = "red")
             lines(datetime, Sub_metering_3, type = "l", col = "blue")
             legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                    col = c("black", "red", "blue"), lty = c(1, 1, 1))
             })
}

make_plot3 <- function() {
        make_plot(plot3, 3)
}