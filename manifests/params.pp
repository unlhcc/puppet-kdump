class kdump::params {

    $path           = '/var/crash'
    $core_collector = 'makedumpfile -c --message-level 1 -d 31'
    $service_ensure = 'running'
    $service_enable = true

}
