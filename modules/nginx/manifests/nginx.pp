class nginx::nginx {
    service { 'nginx.service':
        ensure => running,
        enable => true,
        require => Service['gunicorn.service']
    }

    file { 'nginx.conf':
        path => '/etc/nginx/nginx.conf',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/nginx/nginx.conf'
    }

    selinux::boolean { 'httpd_can_network_connect': }
}
