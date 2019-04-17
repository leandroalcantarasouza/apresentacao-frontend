run on docker

docker run -p 81:80 --name apresentacao-frontend -d --network minharede -e "BACKEND_URI=apresentacao-backend" -v ./default.conf:/etc/nginx/conf.d/default.conf apresentacao-frontend:node 


minikube
:~/projetos/apresentacao-frontend$ minikube mount ./:/var/lib/nginx
substitui o entrypoint default da imagem para poder modificar o arquivo default.conf para o que está no template e executa o nginx apos
docker run -p 81:80 --name apresentacao-frontend -d --network minharede -e "BACKEND_URI=apresentacao-backend" -e "BACKEND_PORT=8080" -e "NGINX_PORT=80" -v /var/lib/nginx/default.conf.template:/etc/nginx/conf.d/default.conf.template --entrypoint /bin/bash apresentacao-frontend:nginx -c "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"