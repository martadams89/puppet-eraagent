# @summary A short summary of the purpose of this class
#
# This class installs the eset management agent
# 
class eraagent::install {

  if ! $eraagent_path {

    file { '/tmp/esmcagentinstall.sh':
      ensure  => present,
      content => epp('eraagent/esmcagentinstall.sh.epp'),
    }

    exec { 'sh /tmp/esmcagentinstall.sh':
      path    => ['/usr/bin', '/usr/sbin', '/bin'],
      require => File['/tmp/esmcagentinstall.sh'],
      returns => [0, 2]
    }

  }

}
