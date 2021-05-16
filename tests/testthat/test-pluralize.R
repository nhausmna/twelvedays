context("running pluralize_gift")
library(twelvedays)
library(stringr)
library(dplyr)
library(glue)
library(purrr)

test_that("running pluralize_gift", {
  expect_equal( pluralize_gift("moose"), "meese")
  expect_equal( pluralize_gift("dog"), "dogs")
})
