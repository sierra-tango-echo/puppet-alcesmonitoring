################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2014 Alces Software Ltd
##
################################################################################
class alcesmonitoring::ganglia
(
  $gmond=true,
  $gmetad=true,
  $clustername=$alcesmonitoring::clustername,

  #network master ip  
  $master_ip=$alcesmonitoring::master_ip,

  #mode - tcp or multicast
  $mode='multicast',
  $tcp_bind_ip=$alcesnetwork::network::primary_ip,
  
  $gmond_port='8649',
  $multicast_interface=$alcesnetwork::network::primary_interface
)
{

  if $alcesmonitoring::role == 'master' {
    if $gmetad {
      $gmetad_template="alcesmonitoring/ganglia/gmetad.conf.erb"
      package {'ganglia-gmetad':
              ensure=>installed
            }
      package {'ganglia-web':
              ensure=>installed
            }

      file {'/etc/ganglia/gmetad.conf':
            ensure=>present,
            mode=>0644,
            owner=>'root',
            group=>'root',
            content=>template($gmetad_template),
            require=>Package['ganglia-gmetad'],
            notify=>Service['gmetad']
      }
      service {'gmetad':
             enable=>'true',
             ensure=>'running',
             require=>Package['ganglia-gmetad']
      }
      file {'/etc/httpd/conf.d/ganglia.conf':
             mode=>0644,
             owner=>'apache',
             group=>'apache',
             content=>template("alcesmonitoring/ganglia/ganglia-web.conf.erb"),
             require=>Package['httpd'],
             notify=>Service['httpd']
       }
    }
  } else {
    service {'gmetad':
             enable=>'false',
             ensure=>'stopped',
    }

  }

  if $gmond {
    $gmond_template="alcesmonitoring/ganglia/gmond.erb"

    package {'ganglia-gmond':
              ensure=>installed
            }

    file {'/etc/ganglia/gmond.conf':
          ensure=>present,
          mode=>0644,
          owner=>'root',
          group=>'root',
          content=>template($gmond_template),
          require=>Package['ganglia-gmond'],
          notify=>Service['gmond']
    }

    file_line {'ganglia-route':
      ensure=>present,
      path=>'/etc/sysconfig/static-routes',
      line=>inline_template("any net 224.0.0.0 netmask 240.0.0.0 dev <%=@multicast_interface%>"),
      require=>Class['alcesnetwork']
    }
  
    service {'gmond':
             enable=>'true',
             ensure=>'running',
             require=>Package['ganglia-gmond']
    }
  } else {
    service {'gmond':
             enable=>'false',
             ensure=>'stopped'
    }
  }
}
