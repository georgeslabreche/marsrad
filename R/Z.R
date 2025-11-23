#' Solar zenith angle
#'
#' Calculates the angle between the sun's rays and the vertical (zenith) direction.
#' A zenith angle of 0° means the sun is directly overhead, while 90° means the sun
#' is at the horizon. Implements Equation 6 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param Ts Solar time [h]
#'
#' @return Sun zenith angle [deg]
#' @export
Z = function(Ls, phi, Ts){
  
  # Equation 7: Declination angle [rad].
  delta = declination(Ls)
  
  # Equation 8: Hour angle [deg].
  omega = 15 * Ts - 180
  
  # Equation 6: Zenith angle of the incident solar radiation [deg].
  a = sin(phi*pi/180) * sin(delta)
  b = cos(phi*pi/180) * cos(delta) * cos(omega * pi/180)
  
  # Calculate z.
  z = acos(a + b) * 180/pi
  
  # Return result.
  return(z)
}