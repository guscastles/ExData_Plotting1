library(tidyr)
library(dplyr)
library(lubridate)

make_plot <- function(make_function, plot_number) {
        png(file = paste0("plot", plot_number, ".png"), width = 480, height = 480)
        make_function(fetch_data())
        dev.off()
}

fetch_data <- function() {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        dest_file <- url %>% download_data
        dataset <- dest_file %>% read_data
	dataset
}

download_data <- function(url) {
        url_decoded <- URLdecode(url)
        dest_file <- tail(unlist(strsplit(url_decoded, "/")), 1)
        if (!file.exists(dest_file)) {
                download.file(url, destfile = dest_file)
                unzip(dest_file)
        }
        dest_file
}

read_data <- function(file_name) {
        
        change_columns <- function(data_set) {
                header <- read.delim("household_power_consumption.txt", nrows = 1,
                                     sep = ";", header = TRUE)
                colnames(data_set) <- colnames(header)
                data_set
        }
        
        dataset <- read.delim("household_power_consumption.txt", skip = 66637,
                              nrows = 2880, sep = ";", header = FALSE)
        dataset %>%
                change_columns %>%
                mutate(datetime = as.POSIXct(strptime(paste(Date, Time, sep = " "),
                                                      "%d/%m/%Y %H:%M:%S")))
}
