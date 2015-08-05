# puppet-kdump
kdump puppet module for HCC. Manages /etc/kdump.conf but does not tweak grub.conf, so that needs to be handled elsewhere.

## Usage:
Basic usage:
```
class { 'kdump': }
```
Or overriding the defaults:
```
class { 'kdump':
    path => '/scratch/crash',
    core_collector => 'makedumpfile -c --message-level 1 -d 31'
}
```
Or via hiera:
```
kdump::path: '/scratch/crash'
kdump::core_collector: 'makedumpfile -c --message-level 1 -d 31'
```
