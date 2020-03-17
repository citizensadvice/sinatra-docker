# Base Sinatra image

## Build

docker build -t citizensadvice/sinatra .
docker run -it citizensadvice/sinatra

## Update gems

docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app citizensadvice/sinatra bundle update
