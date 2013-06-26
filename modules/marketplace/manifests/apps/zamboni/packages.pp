# marketplace packages
class marketplace::apps::zamboni::packages {
    # These will probably need to be virtual someday
    package {
        'python-imaging':
            ensure => '1.1.7-19.el6';

        'python-jinja2':
            ensure => '2.5.5-1';

        'python-lxml':
            ensure => '2.2.6-1';

        'python-markupsafe':
            ensure => '0.15-1';

        'python-pylibmc':
            ensure => '1.2.3-1';

        'python-simplejson':
            ensure => '2.3.2-1';

        'node-less':
            ensure => '1.4.0-1';

        'node-stylus':
            ensure => '0.32.1-1';

        'MySQL-python':
            ensure => '1.2.3-0.3.c1.1.el6';
    }
}