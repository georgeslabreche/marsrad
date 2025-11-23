# Disable warnings.
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = FALSE)

test_that("G_i: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 120
  phi = 22.3
  longitude = -48
  Ts = 12
  tau = 0.4
  al = 0.1
  beta = 30
  gamma_c = 0

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_i(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                      z = z, tau = tau, al = al, beta = beta, gamma_c = gamma_c)

  # Calculate without z (let it be calculated from default)
  result_without_z = G_i(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                         tau = tau, al = al, beta = beta, gamma_c = gamma_c)

  # Results should be identical
  expect_equal(result_with_z, result_without_z)
})

test_that("G_bi: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 90
  phi = 22.48
  Ts = 12
  tau = 0.5
  beta = 25
  gamma_c = 0

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_bi(Ls = Ls, phi = phi, Ts = Ts, z = z,
                       tau = tau, beta = beta, gamma_c = gamma_c)

  # Calculate without z
  result_without_z = G_bi(Ls = Ls, phi = phi, Ts = Ts,
                          tau = tau, beta = beta, gamma_c = gamma_c)

  expect_equal(result_with_z, result_without_z)
})

test_that("G_di: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 90
  phi = 22.48
  longitude = -48
  Ts = 12
  tau = 0.5
  beta = 25

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_di(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                       z = z, tau = tau, beta = beta)

  # Calculate without z
  result_without_z = G_di(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                          tau = tau, beta = beta)

  expect_equal(result_with_z, result_without_z)
})

test_that("G_ali: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 90
  phi = 22.48
  longitude = -48
  Ts = 12
  tau = 0.5
  beta = 25

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_ali(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                        z = z, tau = tau, beta = beta)

  # Calculate without z
  result_without_z = G_ali(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                           tau = tau, beta = beta)

  expect_equal(result_with_z, result_without_z)
})

test_that("G_h: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 90
  phi = 22.48
  longitude = -48
  Ts = 12
  tau = 0.5

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_h(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                      z = z, tau = tau)

  # Calculate without z
  result_without_z = G_h(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                         tau = tau)

  expect_equal(result_with_z, result_without_z)
})

test_that("G_dh: Results identical with and without explicit z parameter", {
  # Test parameters
  Ls = 90
  phi = 22.48
  longitude = -48
  Ts = 12
  tau = 0.5

  # Calculate with z explicitly provided
  z = Z(Ls = Ls, phi = phi, Ts = Ts)
  result_with_z = G_dh(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                       z = z, tau = tau)

  # Calculate without z
  result_without_z = G_dh(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
                          tau = tau)

  expect_equal(result_with_z, result_without_z)
})
