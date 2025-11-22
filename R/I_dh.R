# Diffuse hourly insolation on Mars horizontal surface [Wh/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252
#

#' Diffuse insolation on Mars horizontal surface over time period
#'
#' Calculates the diffuse solar energy (scattered by atmospheric dust) received on a horizontal
#' surface between specified start and end times. Computed as difference between global and beam insolation.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param Ts_start Start of integration period [h]
#' @param Ts_end End of integration period [h]
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#'
#' @return Diffuse insolation over specified time period [Wh/m²]
#' @export
I_dh = function(Ls, phi, longitude, tau, Ts_start, Ts_end, al=albedo(latitude=phi, longitude=longitude, tau=tau)){
  
  Ih = I_h(Ls=Ls, phi=phi, longitude=longitude, tau=tau, Ts_start=Ts_start, Ts_end=Ts_end, al=al) - I_bh(Ls=Ls, phi=phi, tau=tau, Ts_start=Ts_start, Ts_end=Ts_end)
  return(Ih)
}