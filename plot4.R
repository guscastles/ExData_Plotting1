source("plot2.R")
source("plot3.R")


plot4 <- function(dataset) {
        par(mfcol = c(2, 2))
        plot2(dataset, ylabel = "Global Active Power")
        plot3(dataset)
}

make_plot4 <- function() {
        make_plot(plot4, 4)
}
