class racsetup::install {

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
		source => "puppet:///modules/racsetup/public-yum-el5.repo", 
    }
	
	package { ["unixODBC-2.2.11-10.el5.i386",
				"oralceasm-support-2.1.7-1.el5.x86_64"]:
		ensure => present,
		require => Package["oracle-validated"],
	}

	package { "oracleasmlib-2.0.4-1.el5.x86_64":
		ensure => present,
		provider => rpm,
		source => "puppet:///modules/racsetup/oracleasmlib-2.0.4-1.el5.x86_64.rpm",
		require => Package["oracle-validated"],
	}	
}