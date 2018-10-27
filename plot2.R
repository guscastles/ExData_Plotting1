source("common.R")

plot2 <- function(dataset, ylabel = "Global Active Power (kilowatts)") {
        nrows <- dim(dataset)[1]
        hour_range <- 1:nrows
        plot(hour_range, dataset$Global_active_power, type = "n", xaxt = "n",
             ylab = ylabel, xlab = "")
        lines(hour_range, dataset$Global_active_power, type = "l")
        axis(1, at = c(1, floor(nrows / 2), nrows),
             labels = create_labels(as.Date(dataset$Date)), tick = TRUE)
}

make_plot2 <- function() {
        png(file = "plot2.png", width = 480, height = 480)
        plot2(fetch_data())
        dev.off()
}