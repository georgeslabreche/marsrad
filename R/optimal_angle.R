#' Optimal tilt angle for maximum daily insolation
#'
#' Calculates the optimal surface tilt angle (beta) that maximizes daily solar energy collection
#' for a given location and season on Mars. The surface is assumed to face the equator.
#' Based on Equations 40 and 43 from Appelbaum (1993).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param unit Output unit: 1 for radians, 2 for degrees (default: 1)
#'
#' @return Optimal tilt angle [rad] or [deg] depending on unit parameter
#' @export
#'
optimal_angle = function(Ls, phi, unit=1){
  
  if(!unit %in% c(1, 2)){
    stop("Unit option must either be 1 for radians or 2 for degrees.")
  }
  
  # Declination angle [deg].
  delta = declination(Ls, unit=2)

  # Sunrise hour angle [deg].
  omega_sr = sunrise(Ls=Ls, phi=phi, unit=2)
  
  # Optimal angle [rad].
  a1 = cos(omega_sr*pi/180) * sin(phi*pi/180) * cos(delta*pi/180)
  b1 = 1 - (2*(omega_sr*pi/180)/pi)^2
  c1 = cos(phi*pi/180) * sin(delta*pi/180)
  
  a2 = cos(omega_sr*pi/180) * cos(phi*pi/180) * cos(delta*pi/180)
  b2 = 1 + (2*(omega_sr*pi/180)/pi)^2
  c2 = sin(phi*pi/180) * sin(delta*pi/180)
  
  beta = -atan((a1 - (b1 * c1)) / (a2 + (b2 * c2)))
  
  # FIXME: Getting opposite of expected sign when Ls=180.
  # Fix this temporary fix or is it OK?
  beta = ifelse(Ls == 180, -beta, beta)
  
  if(unit == 1){
    return(beta)
    
  }else if(unit == 2){
    return(beta*180/pi)
    
  }else{
    # This should not happen.
    stop("An unknown error has occurred.")
  }  
}

