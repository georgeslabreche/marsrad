# FIXME: Update this function so that it figures out if its a polar night or day.

# Equation 16 (1990):  The diffuse irradiance on a horizontal Martian surface.
#
# Gh = Gbh + Gdh
# Determine an expression for the diffuse irradiance based on Eq. 17 and Eq. 18.
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Diffuse irradiance on Mars horizontal surface
#'
#' Calculates the diffuse solar irradiance (scattered by atmospheric dust) incident on a
#' horizontal surface on Mars. Computed as the difference between global and direct beam
#' irradiance. Implements Equation 16 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#' @param longitude Planetary longitude [deg]
#' @param Ts Solar time [h]. Can be NULL for daily calculations
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, 0-1). If not provided, calculated from latitude, longitude, and tau
#'
#' @return Diffuse irradiance on horizontal surface [W/m²]
#' @export
G_dh = function(Ls, phi, longitude, Ts=NULL, z=Z(Ls=Ls, phi=phi, Ts=Ts), tau, al=albedo(latitude=phi, longitude=longitude, tau=tau)){
  # TODO: What happens when Ts is NULL? How is z calculated?
  if(!is_irradiated(Ls=Ls, phi=phi, Ts=Ts, z=z)){
    return(0)
    
  }else{
    Gdh = G_h(Ls=Ls, phi=phi, longitude=longitude, Ts=Ts, z=z, tau=tau, al=al) - G_bh(Ls=Ls, phi=phi, Ts=Ts, z=z, tau=tau)
    return(Gdh)
  }
} 