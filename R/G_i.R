# FIXME: Update this function so that it figures out if its a polar night or day.

# Equation 3 (1994): Global irradiance on Mars inclined surface [W/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis & Norambuena, Marcos. (1994).
#   Solar radiation on Mars: Tracking photovoltaic array.
#   Journal of Propulsion and Power. 12. 10.2514/3.24044 
#   https://ntrs.nasa.gov/?R=19950004977


#' Global irradiance on Mars inclined surface
#'
#' Calculates the total solar irradiance (direct beam + diffuse + albedo-reflected) incident
#' on an inclined surface on Mars. Implements Equation 3 from Appelbaum, Flood & Norambuena (1994).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param Ts Solar time [h]
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#' @param beta Surface tilt/slope angle from horizontal [deg]
#' @param gamma_c Surface azimuth angle [deg]. Zero facing equator, east negative, west positive (-180 to +180)
#'
#' @return Global irradiance on inclined surface [W/m²]
#' @export
G_i = function(Ls, phi, longitude, Ts, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau, al=albedo(latitude=phi, longitude=longitude, tau=tau), beta, gamma_c){
  
  if(gamma_c > 180 || gamma_c < -180){
    stop("Surface azimuth angle gamma_c must between -180° and +180° with zero facing the equator, east negative, and west positive.")
  }
  
  a = G_bi(Ls=Ls, phi=phi, Ts=Ts, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau=tau, beta=beta, gamma_c=gamma_c)
  b = G_di(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau=tau, al=al, beta=beta)
  c = G_ali(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau=tau, al=al, beta=beta)
  
  Gi = a + b + c
  
  return(Gi)
}
