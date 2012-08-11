class racsetup::config {
	
	File {
	  owner => 'root',
	  group => 'root', 
	  mode => 0440,
	  require => Class["racsetup::install"],		
	}

	file { "/etc/sysctl.conf":
		source => "puppet:///modules/racsetup/etc/sysctl.conf", 
		notify => Exec["apply_sysctl"],
    }
    
    exec { "apply_sysctl":
    	command => "sysctl -p",
    	path => "/sbin/",
    }
    	
	file { "/etc/fstab":
		source => "puppet:///modules/racsetup/etc/fstab", 
    }
	
	file { "/etc/security/limits.conf":
		source => "puppet:///modules/racsetup/etc/security/limits.conf", 
    }
	
	file { "/etc/sysconfig/ntpd":
		source => "puppet:///modules/racsetup/etc/sysconfig/ntpd", 
    }
	
	file { "/etc/pam.d/login":
		source => "puppet:///modules/racsetup/etc/pam.d/login", 
    }
}