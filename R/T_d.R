# Equation 10 (1990): Number of Mars daylight hours.
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://www.researchgate.net/publication/256334925_Solar_radiation_on_Mars


#' Number of Mars daylight hours
#'
#' Calculates the duration of daylight (time between sunrise and sunset) for a given
#' location and season on Mars. Implements Equation 10 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#'
#' @return Number of daylight hours [h]
#' @export
T_d = function(Ls, phi){
  
  # Equation 7 (1990): Declination angle [rad].
  delta = declination(Ls)
  
  # Equation 10 (1990).
  Td = (2/15) * (acos(-tan(phi*pi/180) * tan(delta))) * 180/pi

  return(Td)
}