#-----------------------------------------------------------------------
#
# Base function
#
# The base functions were designed to work as abstract function,
# so it could be used in many different contexts executing specific job
# always remembering Unix concept DOTADIW - "Do One Thing And Do It Well"
#
# Developed by
#   base <benjophp@gmail.com>
#
# Copyright base
#
#-----------------------------------------------------------------------
#
# Be careful when editing this file, it is part of a bigger script!
#
# Base - https://github.com/inveks/base
#
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# This function has one main objective:
# 1. Check if a single container is running in local docker
#
# You must/might inform the parameters below:
# 1. Container name which should be check if it is running
# 2. [optional] (default: ) n/a
#
#-----------------------------------------------------------------------

docker_check_container_is_running()
{
    local LOCAL_CONTAINER_NAME LOCAL_RESULT
    
    LOCAL_CONTAINER_NAME=${1:-null}

    [[ $LOCAL_CONTAINER_NAME == "" || $LOCAL_CONTAINER_NAME == null ]] && echoerror "You must inform the container name to the function: '${FUNCNAME[0]}'"

    [[ "$DEBUG" == true ]] && echo "Checking if the container '$LOCAL_CONTAINER_NAME' is running in this server."

    LOCAL_RESULTS=$(docker ps --filter name=$LOCAL_CONTAINER_NAME --filter status=running --format "table {{.Status}}" | grep "Up" | wc -l)

    # Check results
    if [[ $LOCAL_RESULTS > 0 ]]; then
        DOCKER_CONTAINER_IS_RUNNING=true
    else 
        DOCKER_CONTAINER_IS_RUNNING=false
    fi
}
