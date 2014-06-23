################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2014 Alces Software Ltd
##
################################################################################
class alcesmonitoring (
  #Generic Alces variables
  #Supported profiles:
  # - generic
  $profile = hiera('alcesbase::profile','generic'),
  #Supported roles:
  # - slave
  # - master
  $role = hiera('alcesbase::role','slave'),
  #Supported machines
  # - generic
  $machine = hiera('alcesbase::machine','generic'),
  #Cluster name:
  $clustername = hiera('alcesbase::clustername','alcescluster'),
  #Master IP (network master IP addr)
  $master_ip = hiera('alcesbase::masterip'),
  #HA (ha enabled?)
  $ha=$alcesbase::ha,
  #Keep os jitter minimal
  $jitter=$alcesbase::jitter
)
{
  #Configure Ganglia
  class { 'alcesmonitoring::ganglia':
    mode=> hiera('alcesmonitoring::ganglia::mode','multicast'),
    gmond_port=> hiera('alcesmonitoring::ganglia::port','8649'),
  }

  #Configure Nagios
  class { 'alcesmonitoring::nagios':
  }
}
