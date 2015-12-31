define initscript::service(
                            $cmd,
                            $initscript=$name,
                          ) {

  file { "/etc/init.d/${initscript}":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/initscript.erb"),
  }
}
