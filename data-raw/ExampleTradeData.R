## code to prepare `ExampleTradeData` dataset goes here

ReadTradeData <-read.csv("BACI_HS17_Y2020_V202301.csv")
ExampleTradeData<-ReadTradeData[ReadTradeData$i == c(4, 710),]
#ExampleTradeData <- ReadTradeData[ReadTradeData$i %in% c(4, 710) & nchar(as.character(ReadTradeData$k)) == 6, ][c(FALSE, TRUE, FALSE, FALSE, FALSE), ][c(FALSE, TRUE, FALSE, FALSE), ][c(FALSE, TRUE, FALSE, FALSE), ][c(FALSE, TRUE, FALSE, FALSE), ][c(FALSE, TRUE, FALSE, FALSE, FALSE), ][c(FALSE, TRUE, FALSE, FALSE, FALSE), ]

usethis::use_data(ExampleTradeData, overwrite = TRUE, compress = "xz")
