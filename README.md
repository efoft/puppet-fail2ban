# puppet-fail2ban

## Installation
Clone to puppet's modules directory:
```
git clone git@github.com:efoft/puppet-fail2ban.git fail2ban
```

## Usage
Example:
```
class { 'fail2ban':
  ignoreip => ['127.0.0.1/8','10.1.1.200/32']
}

fail2ban::jail { 'sshd': }
```
