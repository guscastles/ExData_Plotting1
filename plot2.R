source("common.R")

plot2 <- function(dataset) {
        png(file = "plot2.png", width = 480, height = 480)
        nrows <- dim(dataset)[1]
        hour_range <- 1:nrows
        plot(hour_range, dataset$Global_active_power, type = "n", xaxt = "n",
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(hour_range, dataset$Global_active_power, type = "l")
        axis(1, at = c(1, floor(nrows / 2), nrows),
             labels = create_labels(as.Date(dataset$Date)), tick = TRUE)
        dev.off()
}

make_plot2 <- function() {
        plot2(fetch_data())
}