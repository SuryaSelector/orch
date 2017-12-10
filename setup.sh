#
# Build docker images
#
eval $(minikube docker-env)
docker build -t image1 -f docker/Dockerfile.app1 .
docker build -t image2 -f docker/Dockerfile.app2 .
