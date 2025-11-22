Sys.setenv(NET_FLUX_FUNCTION_TYPE = "polynomial")
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = TRUE)

#' Get the net flux function type that is set in the NET_FLUX_FUNCTION_TYPE environment variable.
#' Can either be 'lookup_v1', 'lookup_v2', or 'polynomial'.
#' If NET_FLUX_FUNCTION_TYPE has not been set then default to 'polynomial'.
#'
#' @return Character string: 'lookup_v1', 'lookup_v2', or 'polynomial'
#' @noRd
get_net_flux_function_type = function(){
  net_flux_function_type = ifelse(Sys.getenv("NET_FLUX_FUNCTION_TYPE") == "", "polynomial", Sys.getenv("NET_FLUX_FUNCTION_TYPE"))
  return(net_flux_function_type)
}


#' Get the value set in the NET_FLUX_FUNCTION_SHOW_WARNINGS environment variable that determines if net flux function calculation
#' warnings should be thrown for polynomial calculations that have notable error margin.
#'
#' @return Logical TRUE or FALSE
#' @noRd
show_net_flux_function_warnings = function(){
  
  net_flux_function_type = ifelse(Sys.getenv("NET_FLUX_FUNCTION_SHOW_WARNINGS") == "", "true", Sys.getenv("NET_FLUX_FUNCTION_SHOW_WARNINGS"))
  
  if(tolower(net_flux_function_type) %in% c("1", "f", "false", "n", "no")){
    return(FALSE)
    
  }else{
    # Default to TRUE if set value is not anything other than the recognized values for false.
    return(TRUE)
  }
}

# The function.
#
#' Available optical depth values in net flux lookup tables
#'
#' Returns the tau values available in the selected lookup table version.
#' Only works when NET_FLUX_FUNCTION_TYPE is set to 'lookup_v1' or 'lookup_v2'.
#'
#' @return Numeric vector of available tau values
#' @noRd
f_lookup_taus = function(){
  
  net_flux_function_type = get_net_flux_function_type()
  
  if(net_flux_function_type == "lookup_v1"){
    as.numeric(rownames(df_netflux_0p1_lookup_v1))
    
  }else if(net_flux_function_type == "lookup_v2"){
    as.numeric(rownames(df_netflux_0p1_lookup_v2))
    
  }else{
    stop("This function is only available when the NET_FLUX_FUNCTION_TYPE environment variable is set to 'lookup_v1' or 'lookup_v2'.")
  }
}

#' Available zenith angles in net flux lookup tables
#'
#' Returns the zenith angle values available in the selected lookup table version.
#' Only works when NET_FLUX_FUNCTION_TYPE is set to 'lookup_v1' or 'lookup_v2'.
#'
#' @return Numeric vector of available zenith angle values [deg]
#' @noRd
f_lookup_Zs = function(){
  
  net_flux_function_type = get_net_flux_function_type()
  
  if(net_flux_function_type == "lookup_v1"){
    as.numeric(gsub("X", "", colnames(df_netflux_0p1_lookup_v1)))
    
  }else if(net_flux_function_type == "lookup_v2"){
    as.numeric(gsub("X", "", colnames(df_netflux_0p1_lookup_v2)))
    
  }else{
    stop("This function is only available when the NET_FLUX_FUNCTION_TYPE environment variable is set to 'lookup_v1' or 'lookup_v2'.")
  }
}

#' Coefficient lookup for normalized net flux polynomial
#'
#' Retrieves polynomial coefficients for the analytical net flux function.
#' Based on Table IV in Appelbaum & Flood (1990) Update 1990.
#'
#' @param i Tau exponent index (0-5)
#' @param j Zenith angle exponent index (0-5)
#' @param k Albedo exponent (0 or 1)
#'
#' @return Polynomial coefficient value
#' @noRd
p = function(i, j, k){
  
  if(k==0){
    coefficient = df_netflux_k0_coeffs[j+1, paste("X", i, sep="")]
  }else if(k==1){
    coefficient = df_netflux_k1_coeffs[j+1, paste("X", i, sep="")]
  }else{
    stop("Unsupported k value.")
  }
  
  return(coefficient)
}

#' The normalized net flux function's lookup table lookup.
#'
#' The net solar flux integrated over the solar spectrum on the Martian
#' surface was calculated by Pollack based on multiple wavelength and
#' multiple scattering of the solar radiation.
#'
#' Source: Table III in Appelbaum, Joseph & Flood, Dennis. (1990).
#'
#' @param z Zenith angle [deg].
#' @param tau Optical depth.
#' @param al Albedo, can only be 0.1.
#'
#' @return Normalized net flux.
#' @noRd
f_lookup_v1 = function(z, tau, al=0.1){
  
  if(al != 0.1){
    stop("The albedo can only be 0.1 when using f_lookup_v1.")
  }
  
  return(
    unlist( # Unlist in case a sequence of Zs are given instead of a single value (i.e. in the case of integrations).
      df_netflux_0p1_lookup_v1[df_netflux_0p1_lookup_v1$tau == toString(tau), paste("X", z, sep="")],
      use.names=FALSE
    )
  )
}

#' The normalized net flux function's lookup table lookup.
#'
#' Source: Solar radiation on Mars: Update 1990.
#'  Table III (a) and (b) for an albedo of 0.1.
#'  Table IV  (a) and (b) for an albedo of 0.4.
#'
#' @param z Zenith angle [deg].
#' @param tau Optical depth.
#' @param al Albedo, can be 0.1 or 0.4.
#'
#' @return Normalized net flux.
#' @noRd
f_lookup_v2 = function(z, tau, al=0.1){
  
  nnff_df = NULL
  
  if(al == 0.1){
    nnff_df = df_netflux_0p1_lookup_v2
    
  }else if(al == 0.4){
    nnff_df = df_netflux_0p4_lookup_v2
    
  }else{
    stop("The albedo can only be 0.1 or 0.4 when using f_lookup_v2.")
  }
  
  return(
    unlist( # Unlist in case a sequence of Zs are given instead of a single value (i.e. in the case of integrations).
      nnff_df[nnff_df$tau == toString(tau), paste("X", z, sep="")],
      use.names=FALSE
    )
  )
}


#' The analytical expression of the normalized net flux function.
#'
#' The mean error is about 0.7 percent for the full range. For zenith angles up to 40\u00b0 the error is much smaller.
#' The largest error is for zenith angle of 80\u00b0 and 85\u00b0 and for tau greater than 5. The maximum error is about 7 percent.
#' At these large angles and opacities, the error has a minor effect on the calculated daily insolations.
#'
#' Source: Equation 20? in Appelbaum, Joseph & Flood, Dennis (1990) - Update 1990.
#'
#' @param z Zenith angle [deg].
#' @param tau Optical depth.
#' @param al Albedo.
#'
#' @return Normalized net flux.
#' @noRd
f_analytical = function(z, tau, al=0.1){
  
  # Check for and warn against parameters that would result in lagest errors (max. 7%).
  if(tau > 5 && isTRUE(show_net_flux_function_warnings())){
    warning(paste("Large error encountered with tau = ", tau, " greater than 5 (maximum error is 7%). ", 
                  "Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.",
                  sep="")
    )
  }
  
  if(isTRUE(show_net_flux_function_warnings())){
    # Use ifelse in case this function is being invoked from an integration in which case Z can be a vector instead of a scalar.
    # If Z is a scalar and we use if() then the following issue will occur: "the condition has length > 1 and only the first element will be used."
    warning_msg = ifelse(z >= 80, paste("Possibly large error encountered with z = ", z, "\u00b0 (maximum error is 7% for Z = 80\u00b0 or Z = 85\u00b0). ",
                                        "Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.\n",
                                        sep=""), "")
    
    # Handle warning message.
    for(w_msg in warning_msg){
      if(w_msg != ""){
        warning(w_msg)
      }
    }    
  }
  
  psum = 0
  for(i in seq(0,5,1)){
    for(j in seq(0,5,1)){
      for(k in seq(0,1,1)){
        psum = psum + p(i, j, k) * tau^i * (z/100)^j * al^k
      }
    }
  }
  
  return(psum * (1-al))
}



#' Normalized net flux function
#'
#' Calculates the normalized net solar flux on the Martian surface accounting for multiple
#' wavelength and multiple scattering in the atmosphere. Based on Pollack's calculations
#' presented in Appelbaum & Flood (1990). Can use polynomial expression or lookup tables.
#'
#' @param z Sun zenith angle [deg]
#' @param tau Atmospheric optical depth (dimensionless)
#' @param al Surface albedo (dimensionless, ranges from 0.1 to 0.4)
#'
#' @section Environment Variables:
#' The function behavior can be configured via environment variables:
#'
#' \strong{NET_FLUX_FUNCTION_TYPE}: Controls which implementation to use:
#' \itemize{
#'   \item \code{"polynomial"} (default) - Analytical polynomial expression with ~0.7\% mean error.
#'         Maximum error ~7\% at zenith angles 80-85\u00b0 and tau > 5.
#'   \item \code{"lookup_v1"} - Lookup table from NASA TM-102299. Albedo fixed at 0.1.
#'   \item \code{"lookup_v2"} - Lookup table from NASA TM-103623. Supports albedo 0.1 and 0.4.
#' }
#'
#' Set with: \code{Sys.setenv(NET_FLUX_FUNCTION_TYPE = "polynomial")}
#'
#' \strong{NET_FLUX_FUNCTION_SHOW_WARNINGS}: Controls warning display (TRUE/FALSE, default: TRUE).
#' Warnings are shown when polynomial calculations may have notable error margin (tau > 5 or z >= 80\u00b0).
#'
#' Set with: \code{Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = TRUE)}
#'
#' @return Normalized net flux (dimensionless)
#' @export
f = function(z, tau, al=0.1){
  
  net_flux_function_type = get_net_flux_function_type()
  
  if(net_flux_function_type == "polynomial"){
    net_flux = f_analytical(z, tau, al)
    
  }else if(net_flux_function_type == "lookup_v1"){
    net_flux = f_lookup_v1(z, tau, al)
    
  }else if(net_flux_function_type == "lookup_v2"){
    net_flux = f_lookup_v2(z, tau, al)
    
  }else{
    stop("The NET_FLUX_FUNCTION_TYPE environment variable should be set to 'lookup_v1', 'lookup_v2', or 'polynomial'.")
  }
  
  # Check if given Z results in NULL net flux.
  if(is.null(net_flux)){
    stop(paste("Sun zenith angle z = ", z ,"\u00b0 is not available in the net flux lookup table. Consider using the polynomial function instead.", sep=""))
    
  }
  
  # Check if given tau results in NA net flux.
  # Use ifelse in case this function is being invoked from an integration in which case net_flux can be a vector instead of a scalar.
  isNAs = ifelse(is.na(net_flux), TRUE, FALSE)
  for(isNA in isNAs){
    if(isTRUE(isNA)){
      stop(paste("Optical depth tau factor tau = ", tau," is not available in the net flux lookup table. Consider using the polynomial function instead.", sep=""))
    }
  }
  
  return(net_flux) 
}