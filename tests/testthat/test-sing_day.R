context("running sing_day")
library(twelvedays)
library(stringr)
library(dplyr)
library(glue)
library(purrr)

test_that("running sing_day with multiple lines", {
  xmas2_test <- read.csv("https://www.dropbox.com/s/ap2hqssese1ki4j/xmas_2.csv?dl=1")
  xmas2_test <- xmas2_test %>%
    mutate(number_strings = c('one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve'))
  xmas2_test <- xmas2_test %>%
    mutate(
      Full.Phrase = pmap_chr(xmas2_test, ~make_phrase(..1,
                                                  ..7,
                                                  ..3,
                                                  ..4,
                                                  ..5,
                                                  ..6))
    )

  line <- 5

  expect_equal( sing_day(xmas2_test, line, Full.Phrase), "On the fifth day of Christmas, my true love sent to me,\nfive practice exams,\nfour course reviews,\nthree lost pens,\ntwo meal points,\nand a email from Cal Poly.")
})
