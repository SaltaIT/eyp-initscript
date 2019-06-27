initscript::service { 'demo1337':
  cmd            => 'sleep 1337m',
  debug          => '/democmd.log',
  define_service => true,
}
