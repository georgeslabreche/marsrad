#' Albedo-reflected insolation on Mars inclined surface over time period
#'
#' Calculates the ground-reflected solar energy received on an inclined surface between specified
#' start and end times. Obtained by integrating albedo-reflected irradiance over the time period.
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param Ts_start Start of integration period [h]
#' @param Ts_end End of integration period [h]
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#' @param beta Surface tilt/slope angle from horizontal [deg]
#' @param gamma_c Surface azimuth angle [deg]. Zero facing equator, east negative, west positive (-180 to +180)
#'
#' @return Albedo-reflected insolation on inclined surface over specified time period [Wh/m²]
#' @export
I_ali = function(Ls, phi, longitude, tau, Ts_start, Ts_end, al=albedo(latitude=phi, longitude=longitude, tau=tau), beta, gamma_c){
  
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
    Gali = G_ali(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, tau=tau, al=al, beta=beta)
    return(Gali)
  }
  
  Iali = integrate(integrand, Ts_start, Ts_end)
  
  # Return integration result.
  return(Iali$value)
}
