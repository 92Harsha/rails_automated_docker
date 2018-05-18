echo "****************************Application server******************************"

if [ "$1" != "" ]
 then
    APP_NAME=$1

    APP_PATH=$(pwd)/$APP_NAME

    APP_GEM_PATH=$(pwd)/gems/$APP_NAME

    APP_PORT=5000

    if [ "$2" == "" ]
    then
        RAILS_ENV="development"
    else
        RAILS_ENV=$2
    fi

    if [ "$3" == "code_changed" ]
    then
        CODE_CHANGE="yes"
    else
        CODE_CHANGE="no"
    fi

    echo "Application Name: $APP_NAME"
    echo "Application path: $APP_PATH"
    echo "Port: $APP_PORT"
    echo "Gem path: $APP_GEM_PATH"
    echo "ENV: $RAILS_ENV"
    echo "Code change more: $CODE_CHANGE"

    echo "Stop container if present..................."
    docker stop $APP_NAME

    echo "Remove container if present..................."
    docker rm $APP_NAME

    echo "Build the docker..........................."
    docker build -t $APP_NAME -f DockerFile .

    docker run -it --name $APP_NAME -p $APP_PORT:$APP_PORT --rm -e APP_PORT=$APP_PORT -e RAILS_ENV=$RAILS_ENV -e CODE_CHANGE=$CODE_CHANGE -e APP_NAME=$APP_NAME --volume=$APP_PATH:/opt/$APP_NAME --volume=$APP_GEM_PATH:/usr/local/bundle/ $APP_NAME
 else
     echo "Expect AppName"
 fi