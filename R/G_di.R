#' Diffuse irradiance on Mars inclined surface
#'
#' Calculates the diffuse solar irradiance (scattered by atmospheric dust) incident on an
#' inclined surface on Mars. Accounts for the view factor of the sky from the tilted surface.
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
#' @return Diffuse irradiance on inclined surface [W/m²]
#' @export
G_di = function(Ls, phi, longitude, Ts, z=Z(Ls=Ls,  phi=phi, Ts=Ts), tau, al=albedo(latitude=phi, longitude=longitude, tau=tau), beta){

  # Pass Ts along with phi to avoid parameter mismatch warnings
  Gdi = G_dh(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, z=z, tau=tau, al=al) * cos((beta*pi/180) / 2)^2
  
  # If negative then interpret as no direct irradiance hitting the inclined surface.
  # TODO: Check if negative value is actually possible.
  Gdi = ifelse(Gdi < 0, 0, Gdi)
  return(Gdi)
}