#!/bin/bash
nvidia-smi --query-gpu=index,utilization.gpu,memory.used,memory.free --format=csv
