# FIXME: Error check that albedo value is given and not calculated when using look up table for net_flux.

# Equation 17 (1990): Global irradiance on Mars horizontal surface [W/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Global irradiance on Mars horizontal surface
#'
#' Calculates the total solar irradiance (direct beam + diffuse + albedo) incident on a
#' horizontal surface on Mars. Implements Equation 17 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param Ts Solar time [h]
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#'
#' @return Global irradiance [W/m²]
#' @export
G_h = function(Ls, phi, longitude, Ts=NULL, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau, al=albedo(latitude=phi, longitude=longitude, tau=tau)){
  
  if(!is_irradiated(Ls=Ls, phi=phi, Ts=Ts, z=z)){
    return(0)
    
  }else{
    # Get the normalized net flux value.
    net_flux = f(z=z, tau=tau, al=al)
    
    # Calculate Gh.
    Gh = G_ob(Ls) * cos(z*pi/180) * (net_flux / (1-al))
    
    # Return the result.
    return(Gh)
  }
}