# heka params
class hekad::params {
    $config_dir = '/etc/heka.d'

    file {
        $config_dir:
            ensure  => directory,
            purge   => true,
            recurse => true;
        ['/var/run/hekad', '/var/run/hekad/seekjournals']:
            ensure => directory;
    }
}
