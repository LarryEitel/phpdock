# PhpDock

[Inspired by Laradock](https://github.com/LaraDock/laradock)

## Installation
- Install `Laravel`
- Clone this repo into sibling directory
- Create ssh keys
  - `php-fpm/id_rsa_vm`
  - `php-fpm/id_rsa_vm.pub`
  - `/C/Users/larry/.ssh/id_rsa_vm.ppk` (puttygen'd) Used in PHPStorm for keyless connection
- `cd phpdock`
- docker-compose -d up nginx mariadb
- Visit: `http://laravel/`

Start ssh in container
`docker-compose exec -d php-fpm service ssh start`


##Settings
### Deployment
- Name: `laravel`
- Connection:
  - Type: `SFTP`
  - SFTP host: `laravel` (set domain in hosts to point to docker IP) 
  - Port: 22
  - Root path: `/var/www/laravel`
  - User name: `root`
  - Auth type: `Key pair (OpenSSH or PuTTY)`
  - Private key file: `C:\Users\larry\id_rsa_vm.ppk` (created a puttygen ppk)
  - Web server root URL: `http://laravel`
- Mappings
  - Local Path: `C:\_dk\laravel`  Deployment: `\`
  - Local Path: `C:\_dk\laravel\public` Deployment: `\`

### Languages & Frameworks / PHP
- Developement environment
  - PHP language level `7`
  - Interpreter: `laravel (7.0.7)`
    - Interpreters
      - Name: `laravel`
      - Remote
        - Remote: `Deployment configuration`
        - Deployment configuration: `sftp laravel`
        - Deployment Host URL: ssh://root@laravel:22
      - General
        - PHP executable: `/usr/local/bin/php`
        - (i) PHP version: `7.0.7` Debugger: `Xdebug 2.4.2`
        - (i) Configuration file: `/usr/local/etc/php/php.ini`
  - Path mappings
    - From deployment configuration
      - Local Path: `C:/_dk/laravel`  Deployment: `/var/www/laravel`
      - Local Path: `C:/_dk/laravel/public` Deployment: `/var/www/laravel/public`

### Languages & Frameworks / PHP / Debug
- Xdebug
  - Debug port: `9000` [`x`] Can accept external connections

### Languages & Frameworks / PHP / Servers
- Name: `laravel`
- Host: `laravel` : Port `80` Debugger `Xdebug`
[`x`] Use path mappings
- File/Directory: `C:\_dk\laravel` Absolute: `/var/www/laravel`
- File/Directory: `C:\_dk\laravel\tests` Absolute: `/var/www/laravel/tests`

### Languages & Frameworks / PHP / PHPUnit
- Interpreter: `laravel`
- Path mappings: 
  - Local Path: `C:/_dk/laravel`  Deployment: `/var/www/laravel`
  - Local Path: `C:/_dk/laravel/public` Deployment: `/var/www/laravel/public`
- PHPUnit library
  - [`x`]Use Composer autoloader
  - Path to script: `/var/www/laravel/vendor/autoload.php`
- Test Runner
  - [`x`] Default configuration file: `/var/www/laravel/phpunit.xml`

## Run Debug/Debug Configurations
- PHPUnit: 
  - Name: `ExampleTest`
  - [`x`] Class
  - Class: `ExampleTest`
  - File: `C:\_dk\laravel\tests\ExampleTest.php`
  - Test Runner options: `--colors --tap --verbose --debug` (Probably unnecessary )

# Run Test with Debugging
- Open: `C:\_dk\laravel\tests\ExampleTest.php`
- Set breakpoint on line: `$this->visit('/')`
- Press: `Shift-F9` 
  - SHOULD be stopped on breakpoint!

## License

[MIT License](https://github.com/larryeitel/phpdock/blob/master/LICENSE) (MIT)
