source("common.R")

plot1 <- function(dataset) {
        png(file = "plot1.png", width = 480, height = 480)
        hist(dataset$Global_active_power,
             col = "red",
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
        dev.off()
}

make_plot1 <- function() {
        plot1(fetch_data())
}