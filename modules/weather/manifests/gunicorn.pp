class weather::gunicorn {
    require weather::python
    include weather::nginx

    package { "gunicorn":
        ensure => present,
        require => Package["python36-pip"],
        provider => pip3
    }

    package { 'rest_example_jamesooo':
        provider => pip3,
        ensure => present
    }

    group { 'app':
        ensure => present
    }

    user { 'app':
        ensure => present,
        require => Group['app']
    }

    file { 'gunicorn.service':
        path => '/usr/lib/systemd/system/gunicorn.service',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/weather/gunicorn/gunicorn.service',
        require => Package['rest_example_jamesooo']
    }

    service { 'gunicorn.service':
        provider => 'systemd',
        ensure => running,
        enable => true,
        require => [
            File['gunicorn.service'],
            User['app'],
            File['gunicorn.conf']
        ]
    }

    file { 'gunicorn.conf':
        path => '/etc/tmpfiles.d/gunicorn.conf',
        mode => '0744',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/weather/gunicorn/gunicorn.conf',
        require => Package['rest_example_jamesooo']
    }
}

