# Diffuse daily insolation on Mars horizontal surface [Wh/m2-day].
#
# Obtained by integrating I_dh, diffuse hourly insolation on Mars horizontal surface,
# over the period from sunrise to sunset.
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252
#

#' Diffuse daily insolation on Mars horizontal surface
#'
#' Calculates the diffuse solar energy (scattered by atmospheric dust) received over a full
#' Martian day on a horizontal surface. Obtained by integrating diffuse irradiance from sunrise to sunset.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#'
#' @return Diffuse daily insolation [Wh/m²-day]
#' @export
H_dh = function(Ls, phi, longitude, tau, al=albedo(latitude=phi, longitude=longitude, tau=tau)){
  
  # Integrate I_dh over the period from sunrise to sunset.
  Hdh = I_dh(Ls=Ls, phi=phi, longitude=longitude, tau=tau, Ts_start=0, Ts_end=24, al=al)
  
  # Return result.
  return(Hdh)
}