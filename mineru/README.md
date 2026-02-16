# MinerU Docker 部署

基于 [opendatalab/MinerU](https://github.com/opendatalab/MinerU) 官方配置构建。

## 文件说明

- `docker/Dockerfile` - 完整镜像构建文件
- `docker/compose.yaml` - Docker Compose 服务配置

## 构建镜像

```bash
cd mineru/docker
docker build -t mineru:latest -f Dockerfile .
```

## 启动容器

```bash
docker run --gpus all \
 --shm-size 32g \
 -p 30000:30000 -p 7860:7860 -p 8000:8000 \
 --ipc=host \
 -it mineru:latest \
 /bin/bash
```

## 使用 Docker Compose

### 启动 OpenAI 兼容接口服务
```bash
docker compose -f compose.yaml --profile openai-server up -d
```

### 启动 Web API 服务
```bash
docker compose -f compose.yaml --profile api up -d
```

### 启动 Gradio WebUI
```bash
docker compose -f compose.yaml --profile gradio up -d
```

## 注意事项

- 需要 NVIDIA 显卡（Volta 及以后架构，8G+ 显存）
- 显卡驱动需支持 CUDA 12.8+
- 默认使用 vLLM 加速推理

## 显卡架构说明

- **Ampere、Ada Lovelace、Hopper** (8.0 <= Compute Capability <= 9.0): 使用默认的 `vllm/vllm-openai:v0.10.1.1`
- **Volta、Turing、Blackwell** (7.0 < CC < 8.0 或 CC >= 10.0): 需要改用 `vllm/vllm-openai:v0.11.0`