class initscript::params {

  case $::osfamily
  {
    'redhat' :
    {
    }
    'Debian':
    {
    }
    default  : { fail('Unsupported OS!') }
  }
}
