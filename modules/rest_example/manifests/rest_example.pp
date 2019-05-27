class rest_example::rest_example {
    require base::base

    package { 'rest_example_jamesooo':
        provider => pip3,
        ensure => present
    }

    file { 'rest_example.service':
        path => '/etc/systemd/system/multi-user.target.wants/rest_example.service',
        mode => '0744',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/rest_example/rest_example.service',
        require => Package['rest_example_jamesooo']
    }

    service { 'rest_example.service':
        provider => 'systemd',
        ensure => running,
        enable => true,
        require => File['rest_example.service']
    }

    file { 'rest_example.conf':
        path => '/etc/nginx/conf.d/rest_example.conf',
        mode => '0744',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/rest_example/rest_example.conf'
    }

    service { 'nginx.service':
        ensure => running,
        enable => true,
        require => Service['rest_example.service']
    }
}

