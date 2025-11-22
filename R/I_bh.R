# Equation 19 (1990): Beam hourly insolation on Mars horizontal surface [Wh/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252
#


#' Beam insolation on Mars horizontal surface over time period
#'
#' Calculates the direct beam solar energy received on a horizontal surface between specified
#' start and end times. Implements Equation 19 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param Ts_start Start of integration period [h]
#' @param Ts_end End of integration period [h]
#'
#' @return Beam insolation over specified time period [Wh/m²]
#' @export
I_bh = function(Ls, phi, tau, Ts_start, Ts_end){

  # Step 1: Constrain Ts_start and Ts_end based on sunrise and sunset times.
  
  # Apply solar time range constraint.
  T_range = constrain_solar_time_range(Ls=Ls, phi=phi, Ts_start=Ts_start, Ts_end=Ts_end)

  # No solar irradiance within the contrained time range.
  if(is.null(T_range)){
    return(0)

  }else{
    # Constrain the time range.
    Ts_start = T_range$Ts_start
    Ts_end = T_range$Ts_end
  }
  
  # Step 2: Calculate beam insolation.

  # The integrand for Equation 19 (1990).
  integrand = function(Ts){
    z = Z(Ls=Ls, phi=phi, Ts=Ts)
    x = G_b(Ls=Ls, phi=phi, Ts=Ts, tau=tau) * cos(z*pi/180)
    
    return(x)
  }

  # Equation 19 (1990): Beam hourly insolation on Mars horizontal surface.
  Ibh = integrate(integrand, Ts_start, Ts_end)

  return(Ibh$value)
}

