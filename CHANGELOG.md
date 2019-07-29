# CHANGELOG

## 0.1.12

* Reworked script to get PID from PIDFILE once - thanks to [coreone](https://github.com/coreone) for this [PR-14](https://github.com/NTTCom-MS/eyp-initscript/pull/14)

## 0.1.11

* Add the ability to easily add a service resource for the new init script - thanks to [coreone](https://github.com/coreone) for this [PR-12](https://github.com/NTTCom-MS/eyp-initscript/pull/12)

## 0.1.10

* Allow for the init file to be removed by adding and ensure option - thanks to [coreone](https://github.com/coreone) for this [PR-10](https://github.com/NTTCom-MS/eyp-initscript/pull/10)

## 0.1.9

* load user's variables
* metadata lint

## 0.1.8

* bugfix **initscript::service**
* added debug options to **initscript::service**

## 0.1.7

* improved init script

## 0.1.6

* added **run_user** to **initscript::service**

## 0.1.5

* bugfix check tcp port

## 0.1.4

* **initscript::service**: added optional tcp check for script's status
* **initscript::service**: customizable pid_file

## 0.1.3

* **initscript::service**: added optional config files
* **initscript::service**: added description for init script
