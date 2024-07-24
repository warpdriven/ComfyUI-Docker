docker ps
docker stop comfyui-wd
docker rm comfyui-wd
#git pull
#docker compose up --build -d
docker compose up -d
docker logs -f comfyui-wd