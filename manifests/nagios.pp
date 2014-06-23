################################################################################
##
## Alces HPC Software Stack - Puppet configuration files
## Copyright (c) 2008-2013 Alces Software Ltd
##
################################################################################
class alcesmonitoring::nagios (
  $nrpe=true,
  $nagios=true
  
)
{
  if ($nagios) or ($nrpe) {
    file {['/var/lib/alces/share/nagios','/var/lib/alces/share/nagios/plugins']:
	ensure=>directory,
	mode=>0755,
	owner=>'alces',
	group=>'alces',
	require=>[File['/var/lib/alces/share'],Package['nrpe']],
    }

    file {'/var/lib/alces/share/nagios/plugins/check_nodeRAID':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_nodeRAID.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/alces-nagios.rb':
   	ensure=>present,
	mode=>0755,
	owner=>'alces',
        group=>'alces',
	content=>template("alcesmonitoring/nagios-plugins/alces-nagios.rb.erb"),
	require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_alces.sample':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_alces.sample.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_corosync':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_corosync.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_dellMDarray':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_dellMDarray.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_dirvish':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_dirvish.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_ECC-IPMI':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_ECC-IPMI.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_GE':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_GE.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_GE_errors':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_GE_errors.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_H7X0_PF':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_H7X0_PF.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_inlettemp':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_inlettemp.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_load_ganglia':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_load_ganglia.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_lustre':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_lustre.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_multipath':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_multipath.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_nut':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_nut.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_PERC_H7X0':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_PERC_H7X0.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_PSUs':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_PSUs.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_QL12300':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_QL12300.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_raid':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_raid.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_RAM_GE':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_RAM_GE.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_rcm':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_rcm.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_sma':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_sma.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/var/lib/alces/share/nagios/plugins/check_userjobs':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-plugins/check_userjobs.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/etc/cron.daily/alces-ecc-check':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-crons/alces-ecc-check.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }
    file {'/etc/cron.hourly/alces-disk-check':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-crons/alces-disk-check.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

    file {'/etc/cron.hourly/alces-ipmi-check':
        ensure=>present,
        mode=>0755,
        owner=>'alces',
        group=>'alces',
        content=>template("alcesmonitoring/nagios-crons/alces-ipmi-check.erb"),
        require=>File['/var/lib/alces/share/nagios/plugins/']
    }

  }

  if $nrpe {
    package {'nrpe':
              ensure=>installed
            }

    package {'MegaCli':
              ensure=>installed
            }

    $nrpe_partial=multitemplate(
            "alcesmonitoring/partials/dynamic/nrpe/$alcesmonitoring::machine/nrpe-commands.erb",
            "alcesmonitoring/partials/dynamic/nrpe/$alcesmonitoring::profile/nrpe-commands.erb",
            "alcesmonitoring/partials/dynamic/nrpe/$alcesmonitoring::role/nrpe-commands.erb",
            "alcesmonitoring/partials/dynamic/nrpe/generic/nrpe-commands.erb")

    file {'/etc/nagios/nrpe.cfg':
          ensure=>present,
          mode=>0644,
          owner=>'nrpe',
          group=>'nrpe',
          content=>multitemplate(
            "alcesmonitoring/dynamic/nagios/$alcesmonitoring::profile/nrpe.erb",
            "alcesmonitoring/dynamic/nagios/$alcesmonitoring::role/nrpe.erb",
            "alcesmonitoring/dynamic/nagios/generic/nrpe.erb"),
          require=>Package['nrpe'],
          notify=>Service['nrpe']
    }
  
    service {'nrpe':
             enable=>'true',
             ensure=>'running',
             require=>Package['nrpe']
    }
    user {'nrpe':
      groups=>['alces'],
      require=>Package['nrpe'],
    }

  } else {
    service {'nrpe':
             enable=>'false',
             ensure=>'stopped'
    }
  }
  if $nagios {
    if $alcesmonitoring::role == 'master' {
      user {'nagios':
        groups=>['apache','alces'],
        require=>Package['nagios'],
      }
      package {'nagios':
                ensure=>installed
              }
      package {'nagios-plugins':
               ensure=>installed
              }
      package {'nagios-plugins-alces':
               ensure=>installed
              }
      service {'nagios':
               enable=>'true',
               ensure=>'running',
               require=>Package['nagios']
              }
      file {'/etc/nagios/cgi.cfg':
            ensure=>present,
            mode=>0644,
            owner=>'nagios',
            group=>'nagios',
            content=>template("alcesmonitoring/nagios/cgi.cfg.erb"),
            require=>Package['nagios'],
            notify=>Service['nagios']
       }
       file {'/etc/nagios/nagios.cfg':
	     mode=>0644,
             owner=>'nagios',
             group=>'nagios',
             content=>template("alcesmonitoring/nagios/nagios.cfg.erb"),
             require=>Package['nagios'],
             notify=>Service['nagios']
       }
       file {'/etc/nagios/objects/cluster.cfg':
             mode=>0644,
             owner=>'nagios',
             group=>'nagios',
             content=>template("alcesmonitoring/nagios/cluster.cfg.erb"),
             require=>Package['nagios'],
             notify=>Service['nagios']
       }
       file {'/etc/nagios/objects/commands.cfg':
             mode=>0644,
             owner=>'nagios',
             group=>'nagios',
             content=>template("alcesmonitoring/nagios/commands.cfg.erb"),
             require=>Package['nagios'],
             notify=>Service['nagios']
       }
       file {'/etc/nagios/objects/contacts.cfg':
             mode=>0644,
             owner=>'nagios',
             group=>'nagios',
             content=>template("alcesmonitoring/nagios/contacts.cfg.erb"),
             require=>Package['nagios'],
             notify=>Service['nagios']
       }
       file {'/etc/nagios/objects/timeperiods.cfg':
             mode=>0644,
             owner=>'nagios',
             group=>'nagios',
             content=>template("alcesmonitoring/nagios/timeperiods.cfg.erb"),
             require=>Package['nagios'],
             notify=>Service['nagios']
       }
       file {'/etc/httpd/conf.d/nagios.conf':
             mode=>0644,
             owner=>'apache',
             group=>'apache',
             content=>template("alcesmonitoring/nagios/nagioshttpd.conf.erb"),
             require=>Package['httpd'],
             notify=>Service['httpd']
       }
    }
  }
    


  
}
