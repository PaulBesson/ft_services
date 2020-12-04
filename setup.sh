minikube start --driver=docker
eval $(minikube docker-env)
#-p minikube

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build srcs/nginx -t service_nginx
docker build srcs/wordpress -t service_wordpress
docker build srcs/mysql -t service_mysql
docker build srcs/phpmyadmin -t service_phpmyadmin

#kubectl apply -f srcs/nginx/nginx.yaml
#kubectl apply -f srcs/wordpress/wordpress-deployment.yaml
#kubectl apply -f srcs/mysql/mysql-deployment.yaml
#kubectl apply -f srcs/metallb.yaml
#kubectl apply -f srcs/phpmyadmin/phpmyadmin-deployment.yaml

kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/wordpress/wordpress-deployment.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin-deployment.yaml
kubectl delete -f srcs/metallb.yaml

kubectl create -f srcs/nginx/nginx.yaml
kubectl create -f srcs/wordpress/wordpress-deployment.yaml
kubectl create -f srcs/mysql/mysql-deployment.yaml
kubectl create -f srcs/phpmyadmin/phpmyadmin-deployment.yaml
kubectl create -f srcs/metallb.yaml