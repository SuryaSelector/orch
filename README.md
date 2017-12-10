# Setup for Selector
## Prerequisites for MAC OSX 
Install the following software

* iTerm2 (https://www.iterm2.com/)

* Virtualbox (https://www.virtualbox.org/wiki/Downloads)

* Brew (https://brew.sh/)

* Docker (https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)

* Kubectl (https://kubernetes.io/docs/tasks/tools/install-kubectl/)

* Minikube (https://github.com/kubernetes/minikube/releases)

Verify Minikube bootstraps by running 
```
minikube start
kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl delete deployment hello-minikube
minikube stop
```

## Setting up Selector Kube

Clone the Selector Orchestration repository 
```
git clone https://github.com/SuryaSelector/orch.git
cd orch
```

Setup minikube docker environment
```
eval $(minikube docker-env)
```

Setup docker images
```
./setup.sh
```

Verify docker images are setup 
```
docker images
```

Launch minikube - this may take a minute 
```
minikube start
```

Start kubernetes pod
```
kubectl create -f kubernetes/kube.yaml
```

Verify the pod is running
```
$ kubectl get pod selector-pod
NAME           READY     STATUS    RESTARTS   AGE
selector-pod   2/2       Running   0          8m
```
More details. You can see the containers specified.
```
kubectl describe pod selector-pod
```

You can exec shell to each container in the pod using 
```
kubectl exec -it selector-pod --container sel1 -- /bin/bash
root@selector-pod:/#

kubectl exec -it selector-pod --container sel2 -- /bin/bash
root@selector-pod:/#
```

## Cleanup 

Delete the deployment
```
kubectl delete pod selector-pod
```

Stop Minikube
```
minikube stop
```
