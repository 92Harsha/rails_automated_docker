echo "****************************Application server******************************"

if [ "$1" != "" ]
 then
    APP_NAME=$1
    echo ">>>>>>>>>>>>>>>>App_name:"$APP_NAME
    APP_PATH=$(pwd)/$APP_NAME
    echo ">>>>>>>>>>>>>>>>App_path:"$APP_PATH
    APP_GEM_PATH=$(pwd)/gems/$APP_NAME
    echo ">>>>>>>>>>>>>>>>App_gem_path:"$APP_GEM_PATH

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
    echo "Going to run on $2 mode with code changes: $CODE_CHANGE"

    echo "Stop container if present..................."
    docker stop $APP_NAME

    echo "Remove container if present..................."
    docker rm $APP_NAME

    echo "Build the docker..........................."
    docker build -t $APP_NAME -f DockerFile .

    docker run -it --name $APP_NAME -p 3001:3001 --rm -e RAILS_ENV=$RAILS_ENV -e CODE_CHANGE=$CODE_CHANGE -e APP_NAME=$APP_NAME --volume=$APP_PATH:/opt/$APP_NAME --volume=$APP_GEM_PATH:/usr/local/bundle/ $APP_NAME
 else
     echo "Expect AppName"
 fi