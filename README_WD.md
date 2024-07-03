# WarpDriven CompfyUI doc

## Start the docker

```shell
docker compose up -d

Total VRAM 24217 MB, total RAM 64127 MB
pytorch version: 2.3.0+cu121
xformers version: 0.0.26.post1
Set vram state to: NORMAL_VRAM
Device: cuda:0 NVIDIA GeForce RTX 4090 : cudaMallocAsync
Using xformers cross attention
### Loading: ComfyUI-Manager (V2.43)
### ComfyUI Revision: 1 [fbb7a1f1] | Released on '2024-06-29'

```

**If got issue, check like next, just restart the computer since the Nvidia driver may update without reboot.**
```shell
comfyui-wd  | RuntimeError: CUDA unknown error - this may be due to an incorrectly set up environment, 
e.g. changing env variable CUDA_VISIBLE_DEVICES after program start. Setting the available devices to be zero.

```

## Check Nvidia tools

```shell
nvcc --version
nvidia-smi
```


## Run the default docker container

1. [Download](https://huggingface.co/runwayml/stable-diffusion-v1-5/blob/main/v1-5-pruned-emaonly.ckpt) default checkpoint file: v1-5-pruned-emaonly.ckpt from huggingface.
2. Move v1-5-pruned-emaonly.ckpt file into /data_lake/comfyui_storage/ComfyUI/models/checkpoints
3. Default workflow can run now.

## API Examples:

[Basic Example](https://github.com/comfyanonymous/ComfyUI/blob/master/script_examples/basic_api_example.py)

```python
import json
from urllib import request, parse


def queue_prompt(prompt):
    p = {"prompt": prompt}
    data = json.dumps(p).encode('utf-8')
    req = request.Request("http://127.0.0.1:8188/prompt", data=data)
    request.urlopen(req)
# {
#     "prompt_id": "d9ed1894-81f0-46b5-aa97-232418faa264",
#     "number": 22,
#     "node_errors": {}
# }

def get_history(prompt_id):
    with request.urlopen("http://{}/history/{}".format(server_address, prompt_id)) as response:
        return json.loads(response.read())


def get_image(filename, subfolder, folder_type):
    data = {"filename": filename, "subfolder": subfolder, "type": folder_type}
    url_values = parse.urlencode(data)
    with request.urlopen("http://{}/view?{}".format(server_address, url_values)) as response:
        return response.read()


```