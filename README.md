# Drupal template

# Install Docker

- Install Docker: http://docs.docker.com/engine/installation/
- Install docker-compose: https://docs.docker.com/compose/install/
- Configure NFS (Linux & Mac OS):
  - sudo apt-get install nfs-common

# Install node, npm and yarn

- Install node
  - curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
  - export NVM_DIR="~/.nvm"
  - nvm alias default node
  - node --version
- Install Yarn
  - npm -g i yarn

# Install Composer

- Install composer: https://getcomposer.org/download/
- Setting the composer dependencies:

```bash
composer install
```

# Start environment

```bash
cd docker
./start.sh
```
# Importing the backup

```bash
cd docker
./db-import.sh
```

# Access drupal local environment
- http://drupal.local.com

# Admin

- If you are using the backup
- Access the admin with the credentials:
  - username: admin
  - password: admin 

# Debugging using vscode

- If you are using vscode
- To debug, add the following configuration in ".vscode/launch.json"

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      "port": 9003,
      "pathMappings": {
        "/var/www":"${workspaceFolder}"
      },
      "xdebugSettings": {
          "max_data": 65535,
          "show_hidden": 1,
          "max_children": 100,
          "max_depth": 5
      }
    }
  ]
}
```