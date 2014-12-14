name              "custom"
maintainer        "Ryan Porter"
maintainer_email  "no@example.com"
description       "Custom chef recipes"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.mdown'))
version           "1.0"

%w( apt mysql nginx php-fpm ).each do |d|
  depends d
end
