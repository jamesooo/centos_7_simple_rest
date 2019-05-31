class weather::gunicorn (
    $env = Hash
){
    require weather::python
    include weather::nginx
    
    package { "gunicorn":
        ensure => present,
        require => Package["python36-pip"],
        provider => pip3
    }

    package { 'weather-jamesooo':
        provider => pip3,
        ensure => present,
        install_options => {
            '--target' => '/opt'
        }
    }

    package { 'markupsafe':
        provider => pip3,
        ensure => present,
    }

    group { 'app':
        ensure => present,
        gid => 700
    }

    user { 'app':
        ensure => present,
        uid => 700,
        require => Group['app']
    }

    file { 'gunicorn.service':
        path => '/usr/lib/systemd/system/gunicorn.service',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/weather/gunicorn/gunicorn.service',
        require => Package['weather-jamesooo']
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
        path => '/etc/gunicorn.conf',
        mode => '0744',
        owner => 'root',
        group => 'root',
        content => template('weather/gunicorn/gunicorn.conf.erb'),
        require => Package['weather-jamesooo']
    }
}

