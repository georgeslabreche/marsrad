#' Albedo lookup table
#'
#' Lookup table for Mars surface albedo based on latitude and longitude.
#' Based on NASA Technical Memorandum data.
#'
#' @format A data frame with albedo values indexed by latitude and longitude
#' @keywords internal
"df_albedo"

#' Net flux lookup table (albedo 0.1, version 1)
#'
#' Lookup table for normalized net flux function with albedo fixed at 0.1.
#' From NASA TM-102299 (Appelbaum & Flood, 1989).
#'
#' @format A data frame with net flux values indexed by zenith angle and optical depth
#' @keywords internal
"df_netflux_0p1_lookup_v1"

#' Net flux lookup table (albedo 0.1, version 2)
#'
#' Lookup table for normalized net flux function with albedo 0.1.
#' From NASA TM-103623 (Appelbaum & Flood, 1990).
#'
#' @format A data frame with net flux values indexed by zenith angle and optical depth
#' @keywords internal
"df_netflux_0p1_lookup_v2"

#' Net flux lookup table (albedo 0.4, version 2)
#'
#' Lookup table for normalized net flux function with albedo 0.4.
#' From NASA TM-103623 (Appelbaum & Flood, 1990).
#'
#' @format A data frame with net flux values indexed by zenith angle and optical depth
#' @keywords internal
"df_netflux_0p4_lookup_v2"

#' Net flux polynomial coefficients (k=0)
#'
#' Polynomial coefficients for normalized net flux function calculation (albedo-independent terms).
#' Based on Appelbaum & Flood analytical expression.
#'
#' @format A data frame with polynomial coefficients
#' @keywords internal
"df_netflux_k0_coeffs"

#' Net flux polynomial coefficients (k=1)
#'
#' Polynomial coefficients for normalized net flux function calculation (albedo-dependent terms).
#' Based on Appelbaum & Flood analytical expression.
#'
#' @format A data frame with polynomial coefficients
#' @keywords internal
"df_netflux_k1_coeffs"
