run on docker
              
docker run -p 3000:3000 --name apresentacao-frontend -d --network minharede -e "BACKEND_URI=apresentacao-backend" apresentacao-frontend:node 
              