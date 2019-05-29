class weather::nginx {
    package { "nginx":
        ensure => present,
        require => Package["epel-release"]
    }

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
        source => 'puppet:///modules/weather/nginx/nginx.conf'
    }

    selinux::boolean { 'httpd_can_network_connect': }
}
