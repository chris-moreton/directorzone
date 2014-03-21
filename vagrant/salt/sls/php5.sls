include:
  - apache2
  
php5_ondrej:
  pkgrepo.managed:
    - ppa: ondrej/php5
    
php5:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: php5_ondrej
    - pkgs:
      - python-software-properties
      - php5-curl
      - php5-mcrypt
      - php5-xsl
      - php5-ldap
      - php5-mysql
      - php5-gd
      - php5-intl

a2enmod php5:
  cmd.run:
    - unless: ls /etc/apache2/mods-enabled/php5.load
    - order: 225
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2