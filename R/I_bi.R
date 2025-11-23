#' Beam insolation on Mars inclined surface over time period
#'
#' Calculates the direct beam solar energy received on an inclined surface between specified
#' start and end times. Obtained by integrating beam irradiance over the time period.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param Ts_start Start of integration period [h]
#' @param Ts_end End of integration period [h]
#' @param beta Surface tilt/slope angle from horizontal [deg]
#' @param gamma_c Surface azimuth angle [deg]. Zero facing equator, east negative, west positive (-180 to +180)
#'
#' @return Beam insolation on inclined surface over specified time period [Wh/m²]
#' @export
I_bi = function(Ls, phi, tau, Ts_start, Ts_end, beta, gamma_c){
  
  if(gamma_c > 180 || gamma_c < -180){
    stop("Surface azimuth angle gamma_c must between -180\u00b0 and +180\u00b0 with zero south, east negative, and west positive.")
  }
  
  # Step 1: Constrain Ts_start and Ts_end based on sunrise and sunset times.
  
  # Apply solar time range constraint.
  T_range = constrain_solar_time_range(Ls=Ls, phi=phi, Ts_start=Ts_start, Ts_end=Ts_end, beta=beta, gamma_c=gamma_c)
  
  # No solar irradiance within the contrained time range.
  if(is.null(T_range)){
    return(0)
    
  }else{
    # Constrain the time range.
    Ts_start = T_range$Ts_start
    Ts_end = T_range$Ts_end
  }
  
  # Step 2: Calculate insolation.
  
  integrand = function(Ts){
    Gbi = G_bi(Ls=Ls, phi=phi, Ts=Ts, tau=tau, beta=beta, gamma_c=gamma_c)
    return(Gbi)
  }
  
  Ibi = integrate(integrand, Ts_start, Ts_end)
  
  # Return integration result.
  return(Ibi$value)
}
