source("common.R")

plot1 <- function(dataset) {
        hist(dataset$Global_active_power,
             col = "red",
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
}

make_plot1 <- function() {
        png(file = "plot1.png", width = 480, height = 480)
        plot1(fetch_data())
        dev.off()
}