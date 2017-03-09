define initscript::service(
                            $cmd,
                            $initscript     = $name,
                            $option_scripts = [],
                            $description    = "default script for ${name}",
                          ) {

  file { "/etc/init.d/${initscript}":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/initscript.erb"),
  }
}
