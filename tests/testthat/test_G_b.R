# Disable warnings.
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = FALSE)

test_that("G_b: Direct beam irradiance normal to solar rays", {
  # Test parameters
  Ls = 90     # Areocentric longitude (northern summer solstice)
  phi = 22.48 # Viking 1 latitude
  Ts = 12     # Solar time (noon)
  tau = 0.5   # Optical depth

  # Test normal irradiated case
  result = G_b(Ls = Ls, phi = phi, Ts = Ts, tau = tau)
  expect_true(is.numeric(result))
  expect_true(result > 0)

  # Test with explicit zenith angle
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result2 = G_b(Ls = Ls, z = z, tau = tau)
  expect_equal(result, result2)

  # Test nighttime (not irradiated) - should return 0
  # Use a time well after sunset (Ts = 0 is midnight)
  result_night = G_b(Ls = Ls, phi = phi, Ts = 0, tau = tau)
  expect_equal(result_night, 0)

  # Test with sun below horizon (z >= 90)
  result_below = G_b(Ls = Ls, z = 95, tau = tau)
  expect_equal(result_below, 0)
})
