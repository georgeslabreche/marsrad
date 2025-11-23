# Global daily insolation on Mars horizontal surface [Wh/m2-day].
#
# Obtained by integrating I_h, global hourly insolation on Mars horizontal surface, 
# over the period from sunrise to sunset.
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Global daily insolation on Mars horizontal surface
#'
#' Calculates the total solar energy received over a full Martian day on a horizontal surface.
#' Obtained by integrating global hourly insolation from sunrise to sunset.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#'
#' @return Global daily insolation [Wh/m²-day]
#' @export
H_h = function(Ls, phi, longitude, tau, al=albedo(latitude=phi, longitude=longitude, tau=tau)){

  # Hh is obtained by integrating Ih over the period from sunrise to sunset.
  Hh = I_h(Ls=Ls, phi=phi, longitude=longitude, tau=tau, Ts_start=0, Ts_end=24, al=al)
  
  # Return result.
  return(Hh)
}
              
              
              