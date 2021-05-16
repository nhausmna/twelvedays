context("running make_phrase")
library(twelvedays)
library(stringr)
library(dplyr)
library(glue)
library(purrr)

test_that("running make_phrase", {
  expect_equal( make_phrase(num = 10,
                            num_word = "ten",
                            item = "lords",
                            verb = "a-leaping",
                            adjective = "",
                            location = ""), "ten lords a-leaping")
})
