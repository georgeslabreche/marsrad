# Suppress R CMD check NOTEs about global variables
utils::globalVariables(c(
  "df_albedo",
  "df_netflux_0p1_lookup_v1",
  "df_netflux_0p1_lookup_v2",
  "df_netflux_0p4_lookup_v2",
  "df_netflux_k0_coeffs",
  "df_netflux_k1_coeffs"
))
