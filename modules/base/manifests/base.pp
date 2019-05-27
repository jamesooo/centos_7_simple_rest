class base::base {
    package { "epel-release":
        ensure => present,
    }

    package { "python36-pip":
        ensure => present,
        require => Package["epel-release"]
    }

    package { "python36":
        ensure => present,
        require => Package["epel-release"]
    }

    package { "nginx":
        ensure => present,
        require => Package["epel-release"]
    }

    package { "gunicorn":
        ensure => present,
        require => Package["python36-pip"],
        provider => pip3
    }
}
