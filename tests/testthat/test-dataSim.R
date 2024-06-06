library(testthat)

test_that("dataSim returns correct output types", {
  set.seed(123)  # For reproducibility

  # Test returnOption 1: Summary table
  expect_is(dataSim(returnOption = 1, plot = FALSE), "array")

  # Test returnOption 2: SpatRaster object
  expect_s3_class(dataSim(returnOption = 2, plot = FALSE), "SpatRaster")

  # Test returnOption 3: Distance matrix
  expect_is(dataSim(returnOption = 3, plot = FALSE), "dist")
})

test_that("dataSim handles globalSave correctly", {
  set.seed(123)  # For reproducibility
  expect_false(exists("dataSim_grid", envir = .GlobalEnv))
  dataSim(returnOption = 1, plot = FALSE, globalSave = TRUE)
  expect_true(exists("dataSim_grid", envir = .GlobalEnv))
})

# Note: The following test assumes the function's environment doesn't mask .GlobalEnv
test_that("dataSim creates a grid with expected dimensions", {
  set.seed(123)  # For reproducibility

  # Without actually running the plotting
  result <- dataSim(returnOption = 1, plot = FALSE)

  # Assuming you know the expected dimensions based on your input parameters
  expected_nrow <- length(seq(-25.7, -22.3, by = 10 / 111.32))
  expected_ncol <- length(seq(30.7, 32.2, by = 10 / 111.32))

  dataSim_grid <- get("dataSim_grid", envir = .GlobalEnv)
  expect_equal(nrow(dataSim_grid), expected_nrow)
  expect_equal(ncol(dataSim_grid), expected_ncol)
})

# You can add more tests for different aspects of the function
