sudo docker system prune -a

sudo docker build -t loan-pred:v3 .
sudo docker run -d --name mycontainer3 -p 8005:8005 loan-pred:v3
