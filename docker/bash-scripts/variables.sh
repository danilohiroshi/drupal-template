# environment
# urls
declare -a _URLS=("drupal.local.com")

# add others languages
_URLS+=("drupal.local.com.br")

# export the list of URLs to be read by docker compose
export URLS=$(insert_comma_after_each_string "${_URLS[@]}")

## variables for the scripts
_DOCKER_COMPOSE_LINUX_FILE="docker-compose.yaml"
_DOCKER_COMPOSE_FILE=$_DOCKER_COMPOSE_LINUX_FILE
