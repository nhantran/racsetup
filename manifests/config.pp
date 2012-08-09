class racsetup::config {

	file { "/etc/sysctl.conf":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racsetup/etc/sysctl.conf", 
		require => Class["racsetup::install"],
    }
	
	file { "/etc/fstab":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racsetup/etc/fstab", 
		require => Class["racsetup::install"],
    }
	
	file { "/etc/security/limits.conf":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racsetup/etc/security/limits.conf", 
		require => Class["racsetup::install"],
    }
	
	file { "/etc/sysconfig/ntpd":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racsetup/etc/sysconfig/ntpd", 
		require => Class["racsetup::install"],
    }
	
	file { "/etc/pam.d/login":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racsetup/etc/pam.d/login", 
		require => Class["racsetup::install"],
    }
}