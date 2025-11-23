#' Diffuse daily insolation on Mars inclined surface
#'
#' Calculates the diffuse solar energy (scattered by atmospheric dust) received over a full
#' Martian day on an inclined surface. Obtained by integrating diffuse irradiance from sunrise to sunset.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#' @param beta Surface tilt/slope angle from horizontal [deg]
#' @param gamma_c Surface azimuth angle [deg]. Zero facing equator, east negative, west positive (-180 to +180)
#'
#' @return Diffuse daily insolation on inclined surface [Wh/m²-day]
#' @export
H_di = function(Ls, phi, longitude, tau, al=albedo(latitude=phi, longitude=longitude, tau=tau), beta, gamma_c){
  
  if(gamma_c > 180 || gamma_c < -180){
    stop("Surface azimuth angle gamma_c must between -180 and 180 degress with zero south, east negative, and west positive.")
  }
  
  # Hdi is obtained by integrating Idi over the period from sunrise to sunset.
  Hdi = I_di(Ls=Ls, phi=phi, longitude=longitude, tau=tau, Ts_start=0, Ts_end=24, al=al, beta=beta, gamma_c=gamma_c)
  
  # Return result.
  return(Hdi)
}