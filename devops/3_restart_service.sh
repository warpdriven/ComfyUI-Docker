docker ps
docker stop comfyui-wd
git pull
docker compose up --build -d
docker logs -f comfyui-wd