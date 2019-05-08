class initscript::params {

  case $::osfamily
  {
    'redhat' :
    {
    }
    'Debian':
    {
    }
    'Suse':
    {
    }
    default  : { fail('Unsupported OS!') }
  }
}
