# Disable warnings.
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = FALSE)

test_that("G_obh: Beam irradiance on horizontal surface at top of Mars atmosphere", {
  # Test parameters
  Ls = 90     # Areocentric longitude (northern summer solstice)
  phi = 22.48 # Viking 1 latitude
  Ts = 12     # Solar time (noon)

  # Calculate using phi and Ts
  result1 = G_obh(Ls = Ls, phi = phi, Ts = Ts)
  expect_true(is.numeric(result1))
  expect_true(result1 >= 0)

  # Calculate using explicit zenith angle
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result2 = G_obh(Ls = Ls, z = z)
  expect_equal(result1, result2)

  # Test at different times of day
  for (Ts_test in c(6, 9, 12, 15, 18)) {
    result = G_obh(Ls = Ls, phi = phi, Ts = Ts_test)
    expect_true(is.numeric(result))
    expect_true(result >= 0)
  }

  # Test at different seasons
  for (Ls_test in seq(0, 360, 90)) {
    result = G_obh(Ls = Ls_test, phi = phi, Ts = Ts)
    expect_true(is.numeric(result))
    expect_true(result >= 0)
  }
})
