
#' Beam daily insolation on Mars inclined surface
#'
#' Calculates the direct beam solar energy received over a full Martian day on an inclined surface.
#' Obtained by integrating beam irradiance from sunrise to sunset.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param beta Surface tilt/slope angle from horizontal [deg]
#' @param gamma_c Surface azimuth angle [deg]. Zero facing equator, east negative, west positive (-180 to +180)
#'
#' @return Beam daily insolation on inclined surface [Wh/m²-day]
#' @export
H_bi = function(Ls, phi, tau, beta, gamma_c){
  
  if(gamma_c > 180 || gamma_c < -180){
    stop("Surface azimuth angle gamma_c must between -180 and 180 degress with zero south, east negative, and west positive.")
  }
  
  # Hbi is obtained by integrating Ibi over the period from sunrise to sunset.
  Hbi = I_bi(Ls=Ls, phi=phi, tau=tau, Ts_start=0, Ts_end=24, beta=beta, gamma_c=gamma_c)
  
  # Return result.
  return(Hbi)
}