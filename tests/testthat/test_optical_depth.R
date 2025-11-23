# Disable warnings.
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = FALSE)

test_that("optical_depth: Atmospheric optical depth calculation", {
  # Test parameters from documentation example
  Ls = 215    # Areocentric longitude (dust storm season)
  phi = 22.3  # Viking Lander 1 latitude

  # Test model 1
  tau1 = optical_depth(Ls = Ls, phi = phi, model = 1)
  expect_true(is.numeric(tau1))
  expect_true(tau1 >= 0.5)  # Minimum value enforced by function

  # Test model 2
  tau2 = optical_depth(Ls = Ls, phi = phi, model = 2)
  expect_true(is.numeric(tau2))
  expect_true(tau2 >= 0.5)  # Minimum value enforced by function

  # Models should give different results
  expect_false(identical(tau1, tau2))

  # Test across different seasons
  for (Ls_test in seq(0, 360, 30)) {
    result1 = optical_depth(Ls = Ls_test, phi = phi, model = 1)
    result2 = optical_depth(Ls = Ls_test, phi = phi, model = 2)

    expect_true(is.numeric(result1))
    expect_true(is.numeric(result2))
    expect_true(result1 >= 0.5)
    expect_true(result2 >= 0.5)
  }

  # Test across different latitudes
  for (phi_test in seq(-90, 90, 30)) {
    result1 = optical_depth(Ls = Ls, phi = phi_test, model = 1)
    result2 = optical_depth(Ls = Ls, phi = phi_test, model = 2)

    expect_true(is.numeric(result1))
    expect_true(is.numeric(result2))
    expect_true(result1 >= 0.5)
    expect_true(result2 >= 0.5)
  }

  # Test invalid model number
  expect_error(
    optical_depth(Ls = Ls, phi = phi, model = 3),
    "Unsupportd model number"
  )
})
