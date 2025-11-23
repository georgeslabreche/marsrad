
#' Albedo-reflected irradiance on Mars inclined surface
#'
#' Calculates the solar irradiance reflected from the Martian surface (ground-reflected radiation)
#' incident on an inclined surface. Accounts for the view factor of the ground from the tilted surface.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param Ts Solar time [h]
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#' @param beta Surface tilt/slope angle from horizontal [deg]
#'
#' @return Albedo-reflected irradiance on inclined surface [W/m²]
#' @export
G_ali = function(Ls, phi, longitude, Ts, z=Z(Ls=Ls, Ts=Ts, phi=phi), tau, al=albedo(latitude=phi, longitude=longitude, tau=tau), beta){

  # Pass Ts along with phi to avoid parameter mismatch warnings
  Gali = al * G_h(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, z=z, tau=tau, al=al) * sin((beta*pi/180) / 2)^2
  
  # If negative then interpret as no albedo irradiance hitting the inclined surface.
  # TODO: Check if negative value is actually possible.
  Gali = ifelse(Gali < 0, 0, Gali)
  return(Gali)
}