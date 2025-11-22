# From (1993): (19) for inclined and (25) for vertical surface.

#' X parameter for inclined surface sunrise/sunset calculations
#'
#' Calculates the X parameter used in determining sunrise and sunset times for inclined surfaces.
#' Implements Equations 19 and 25 from Appelbaum (1993) for inclined and vertical surfaces.
#'
#' @param phi Planetary latitude [rad]
#' @param beta Surface inclination angle [rad]
#' @param gamma_c Surface azimuth angle [rad]
#'
#' @return X parameter (dimensionless)
#' @keywords internal
x_for_inclined_surface = function(phi, beta, gamma_c){
  
  # FIXME: For vertical surface, i.e. beta = 90. Need gamma_s?!?!
  #        See (25) in (1993).
  a = ifelse(round(beta, 2) == round(90*pi/180, 2), 0, cos(phi) / (sin(gamma_c) * tan(beta)))
  b = sin(phi) / tan(gamma_c)
  
  x = a + b
  
  return(x)
}


# From (1993): (20) for inclined and (26) for vertical surface.

#' Y parameter for inclined surface sunrise/sunset calculations
#'
#' Calculates the Y parameter used in determining sunrise and sunset times for inclined surfaces.
#' Implements Equations 20 and 26 from Appelbaum (1993) for inclined and vertical surfaces.
#'
#' @param phi Planetary latitude [rad]
#' @param beta Surface inclination angle [rad]
#' @param gamma_c Surface azimuth angle [rad]
#' @param delta Solar declination angle [rad]
#'
#' @return Y parameter (dimensionless)
#' @keywords internal
y_for_inclined_surface = function(phi, beta, gamma_c, delta){
  
  # a is zero for a vertical surface, i.e. beta = 90 deg. See (26) from (1993)
  a = ifelse(round(beta, 2) == round(90*pi/180, 2), 0, sin(phi) / (sin(gamma_c) * tan(beta)))
  b = cos(phi) / tan(gamma_c)
  
  y = tan(delta) * (a - b)
  
  return(y)
}
