# define olympia instance.
define marketplace::apps::olympia::web_instance(
  $app_dir,
  $port,
  $appmodule = 'wsgi.zamboni:application',
  $workers = 12,
  $worker_class = 'sync',
  $worker_name = 'addons-olympia-dev',
  $timeout = '90',
  $environ = '',
  $newrelic_license_key = '',
  $newrelic_domain = undef,
  $nginx_settings = undef,
  $user = 'mkt_prod',
) {

  $app_name = $name

  if $newrelic_license_key {
    marketplace::newrelic::python { $app_name:
      before          => Uwsgi::Instance[$worker_name],
      newrelic_domain => $newrelic_domain,
      license_key     => $newrelic_license_key,
    }
  }

  uwsgi::instance { $worker_name:
    app_dir   => "${app_dir}/olympia",
    appmodule => $appmodule,
    port      => $port,
    home      => "${app_dir}/venv",
    user      => $user,
    workers   => $workers,
    environ   => $environ,
  }

  if $nginx_settings {
    $nginx_resources = {
      "${app_name}" => $nginx_settings
    }

    $nginx_defaults = {
      'app_name'    => 'olympia',
      'webroot'     => $app_dir,
      'worker_name' => "uwsgi_${worker_name}",
    }
    create_resources(marketplace::nginx::addons, $nginx_resources, $nginx_defaults)
  }
}
