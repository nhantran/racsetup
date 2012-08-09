define racsetup::instenv( $oraunqname, $orasid, $instancenumber ) {

  File {
  	owner => 'oracle',
    group => 'oinstall',
    mode => '777',
  }

  file {"/home/oracle/.bash_profile":
    content => template('racsetup/.bash_profile.erb'),
  }
  
  file {"/home/oracle/grid_env":
    content => template('racsetup/grid_env.erb'),
  }
  
  file {"/home/oracle/db_env.erb":
    content => template('racsetup/db_env.erb'),
  }
  
}