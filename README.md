# initscript

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What initscript affects](#what-initscript-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with initscript](#beginning-with-initscript)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

Creates a generic sysV initscript given a command to run.

## Module Description

Manages a sysV compatible init script to be able to start arbitrary services

## Setup

### What initscript affects

Creates a **$name** script file on **/etc/init.d** to start and stop a service

### Setup Requirements

None

### Beginning with initscript

basic example from eyp-kibana:

```puppet
initscript::service { 'kibana':
  cmd => "${basedir}/${productname}/bin/kibana",
  require   => [ Class['initscript'], File["${basedir}/${productname}/config/kibana.yml"] ],
  before => Service['kibana'],
}
```

## Usage

* Start a given service using a start command that runs in the foregroundA

```puppet
initscript::service { 'demo1':
  cmd   => 'sleep 1337m',
}
```
* Start a given service using a start command that runs in the foreground using a specific user

```puppet
initscript::service { 'demo2':
  cmd      => 'sleep 666m',
  run_user => 'evil',
}
```
* Start a given service using a command to start it and another command to stop it. Start command have to start the service in the background

```puppet
initscript::service { 'demo3':
  cmd_start => 'nohup sleep 31173m &',
  cmd_stop  => 'pkill sleep',
}
```

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Should work anywhere

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature
