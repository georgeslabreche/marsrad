# Beam daily insolation on Mars horizontal surface  [Wh/m2-day].
#
# Obtained by integrating Equation 19 (1990), beam hourly insolation on Mars horizontal surface,
# over the period from sunrise to sunset.
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Beam daily insolation on Mars horizontal surface
#'
#' Calculates the direct beam solar energy received over a full Martian day on a horizontal surface.
#' Obtained by integrating beam irradiance from sunrise to sunset.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#'
#' @return Beam daily insolation [Wh/m²-day]
#' @export
H_bh = function(Ls, phi, tau){
  
  # Hbh is obtained by integrating Ibh over the period from sunrise to sunset.
  Hbh = I_bh(Ls=Ls, phi=phi, tau=tau, Ts_start=0, Ts_end=24)
  
  # Return result.
  return(Hbh)
}