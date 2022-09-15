Facter.add(:eraagent_path) do
  confine { Facter.value(:kernel) != 'windows' }
  confine { Facter.value(:operatingsystem) != 'nexus' }
  setcode do
    File.exists?('/opt/eset/RemoteAdministrator/Agent/ERAAgent')
  end
end
