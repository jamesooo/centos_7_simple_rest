class weather::python {
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
}
