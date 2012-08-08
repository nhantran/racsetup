class racprereq::install {

	package { "oracle-validated":
		ensure => present,
		require => File["el5repo"],
	}
	
	file { "el5repo":
		path => "/etc/yum.repos.d/public-yum-el5.repo",
		ensure => present,
		owner => 'root',
		group => 'root', 
		mode => 0600,
		source => "puppet:///modules/racprereq/public-yum-el5.repo", 
    }
	
	package { "unixODBC-2.2.11-10.el5.i386":
		ensure => present,
		require => Package["oracle-validated"],
	}
	
	package { "oralceasm-support-2.1.7-1.el5.x86_64":
		ensure => present,
		require => Package["oracle-validated"],
	}

	package { "oracleasmlib-2.0.4-1.el5.x86_64":
		ensure => present,
		provider => rpm,
		source => "puppet:///modules/racprereq/oracleasmlib-2.0.4-1.el5.x86_64.rpm",
		require => Package["oracle-validated"],
	}	
}

class racprereq::config {

	file { "/etc/sysctl.conf":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racprereq/etc/sysctl.conf", 
		require => Class["racprereq::install"],
    }
	
	file { "/etc/fstab":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racprereq/etc/fstab", 
		require => Class["racprereq::install"],
    }
	
	file { "/etc/security/limits.conf":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racprereq/etc/security/limits.conf", 
		require => Class["racprereq::install"],
    }
	
	file { "/etc/sysconfig/ntpd":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racprereq/etc/sysconfig/ntpd", 
		require => Class["racprereq::install"],
    }
	
	file { "/etc/pam.d/login":
		owner => 'root',
		group => 'root', 
		mode => 0440,
		source => "puppet:///modules/racprereq/etc/pam.d/login", 
		require => Class["racprereq::install"],
    }
}