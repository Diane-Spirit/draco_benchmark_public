docker run --rm -it --net host --ipc host \
    -v $(pwd)/datasets/:/root/datasets \
    -v $(pwd)/results/:/root/results \
    -v $(pwd)/dev/scripts/:/root/scripts \
    --name draco draco:latest bash
    