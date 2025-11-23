#' Check if location is experiencing polar day
#'
#' Determines whether a given location on Mars is experiencing polar day (24-hour sunlight)
#' for the specified season. During polar day, the sun remains above the horizon continuously.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#'
#' @return TRUE if experiencing polar day, FALSE otherwise
#' @export
is_polar_day = function(Ls, phi){
  
  # Equation 7 (1990): Declination angle [rad].
  delta = declination(Ls)
  
  # Equations 16 (Update 1991): Figure out if it is polar night or polar day.
  #   Polar night (polar_flag < -1), no solar irradiance.
  #   Polar day (polar_flag > 1), constant solar irradiance. 
  polar_flag = -tan(delta) * tan(phi*pi/180)
  
  # If polar day.
  if(polar_flag > 1){
    # Constant solar irradiance.
    return(TRUE)
    
  }else{
    return(FALSE)
  }
}
