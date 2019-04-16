run on docker

docker run -p 81:80 --name apresentacao-frontend -d --network minharede -e "BACKEND_URI=apresentacao-backend" -v ./nginx.conf:/etc/nginx/nginx.conf -v ./default.conf:/etc/nginx/conf.d/default.conf apresentacao-frontend:node 


minikube
:~/projetos/apresentacao-frontend$ minikube mount ./:/var/lib/nginx
docker run -p 81:80 --name apresentacao-frontend -d --network minharede -e "BACKEND_URI=apresentacao-backend" -v /var/lib/nginx/default.conf:/etc/nginx/conf.d/default.conf -v /var/lib/nginx/default.conf:/etc/nginx/conf.d/default.conf apresentacao-frontend:node