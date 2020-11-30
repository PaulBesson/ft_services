kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

minikube start --driver=docker
eval $(minikube docker-env)
docker build srcs/nginx -t service_nginx
docker build srcs/wordpress -t service_wordpress
docker build srcs/mysql -t mysql:5.6

kubectl delete -f srcs/nginx.yaml
kubectl delete -f srcs/wordpress-deployment.yaml
kubectl delete -f srcs/mysql-deployment.yaml
kubectl delete -f srcs/metallb.yaml

kubectl create -f srcs/nginx.yaml
kubectl create -f srcs/wordpress-deployment.yaml
kubectl create -f srcs/mysql-deployment.yaml
kubectl create -f srcs/metallb.yaml