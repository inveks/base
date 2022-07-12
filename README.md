# Base Scripts 📡 | Work in progress 🚧


## Function responses

All function's responses will be in capital letter and the most commom 'rule' will be to remove the wildcard word from
the response, such as 'check', 'get' and 'put'. 

#### Check functions

Responses will be the function's name without the word 'check': 

```bash
docker_check_container_is_running()
{
    [...]
    DOCKER_CONTAINER_IS_RUNNING=true
}
```

#### Confirm functions

Responses will be the function's name without the word 'confirm' and '_RESPONSE' at the end of the string:

```bash
confirm_user_action()
{
    [...]
    USER_ACTION_RESPONSE=true
}
```
