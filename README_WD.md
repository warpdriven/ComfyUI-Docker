# WarpDriven CompfyUI doc

## Start the docker

```shell
docker compose up -d

# If got issue, check with next
nvcc --version

nvidia-smi


```

## Run the default docker container

1. [Download](https://huggingface.co/runwayml/stable-diffusion-v1-5/blob/main/v1-5-pruned-emaonly.ckpt) default checkpoint file: v1-5-pruned-emaonly.ckpt from huggingface.
2. Move v1-5-pruned-emaonly.ckpt file into /data_lake/comfyui_storage/ComfyUI/models/checkpoints
3. Default workflow can run now.

## API Examples:

[Basic Example](https://github.com/comfyanonymous/ComfyUI/blob/master/script_examples/basic_api_example.py)

