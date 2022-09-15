# @summary A short summary of the purpose of this class
#
# This module aids the installation of the Eset Remote Management Agent
#
# @param eraa_server_hostname
#   Sets the management server hostname.
#
# @param eraa_server_port
#   Sets the management server port. Default value is '2222'.
#
# @param service_enable
#   Whether to enable the eraagent service at boot. Default value: true.
#
# @param service_ensure
#   Whether the eraagent service should be running. Default value: 'running'.
#
# @param service_manage
#   Whether to manage the eraagent service.  Default value: true.
#
# @param service_name
#   The eraagent service to manage. Default value: varies by operating system.
#
# @param service_provider
#   Which service provider to use for NTP. Default value: 'undef'.
#
# @param service_hasstatus
#   Whether service has a functional status command. Default value: true.
#
# @param service_hasrestart
#   Whether service has a restart command. Default value: true.
#
# @example
#   include eraagent
class eraagent(
  String $eraa_server_hostname,
  String $eraa_server_port, 
  Optional[String] $eraa_server_company_name = undef,
  Optional[String] $eraa_http_proxy_hostname = undef,
  Optional[String] $eraa_http_proxy_port = undef,
  Optional[String] $eraa_http_proxy_user = undef,
  Optional[String] $eraa_http_proxy_pass = undef,
  String $eraa_peer_cert_b64,
  String $eraa_peer_cert_pwd = undef,
  String $eraa_ca_cert_b64,
  String $eraa_product_uuid = undef,
  String $eraa_initial_sg_token,
  Optional[String] $eraa_policy_data = undef,
  Boolean $service_enable,
  Enum['running', 'stopped'] $service_ensure,
  Boolean $service_manage,
  String $service_name,
  Optional[String] $service_provider = undef,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart
){
  
  contain eraagent::install
  contain eraagent::service

  Class['::eraagent::install']
  ~> Class['::eraagent::service']

}
