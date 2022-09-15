# @summary A short summary of the purpose of this class
#
# This class controls the eraagent service
#
class eraagent::service {

  if $eraagent::service_manage == true {
    service { 'eraagent':
      ensure     => $eraagent::service_ensure,
      enable     => $eraagent::service_enable,
      name       => $eraagent::service_name,
      provider   => $eraagent::service_provider,
      hasstatus  => $eraagent::service_hasstatus,
      hasrestart => $eraagent::service_hasrestart,
    }
  }

}
