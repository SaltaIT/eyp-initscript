# initscript

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with initscript](#setup)
    * [What initscript affects](#what-initscript-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with initscript](#beginning-with-initscript)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Creates a generic sysV initscript given a command to run.

## Module Description

Creates a generic sysV initscript given a command to run.

## Setup

### What initscript affects

Creates a **$name** script file on **/etc/init.d** to start and stop **$cmd**

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

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

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
