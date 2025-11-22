# FIXME: Update this function so that it figures out if its a polar night or day.

# Equation 18: Beam irradiance on Mars horizontal surface [W/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Direct beam irradiance on Mars horizontal surface
#'
#' Calculates the direct beam solar irradiance incident on a horizontal surface on Mars.
#' Accounts for the angle of incidence on the horizontal plane. Implements Equation 18
#' from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param Ts Solar time [h]
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#' @param tau Atmospheric optical depth (dimensionless)
#'
#' @return Direct beam irradiance on horizontal surface [W/m²]
#' @export
G_bh = function(Ls, phi, Ts, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau){
  
  if(!is_irradiated(Ls=Ls, phi=phi, Ts=Ts, z=z)){
    return(0)
    
  }else{
    G_ob(Ls) * cos(z * pi/180) * exp(-tau / cos(z*pi/180))
  }
} 