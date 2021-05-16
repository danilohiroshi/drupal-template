# Drupal template

# Set up environment

- Install Docker: http://docs.docker.com/engine/installation/
- Install docker-compose: https://docs.docker.com/compose/install/
- Configure NFS (Linux & Mac OS):
  - sudo apt-get install nfs-common
- Install node
  - curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
  - export NVM_DIR="~/.nvm"
  - nvm alias default node
  - node --version
- Install Yarn
  - npm -g i yarn


# Composer

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