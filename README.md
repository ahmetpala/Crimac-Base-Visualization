# CRIMAC-Visualization
Visualize the zarr files using Holoviews and Bokeh

## Clone repository

`mkdir repos`

`cd repos`

`git clone https://github.com/CRIMAC-WP4-Machine-learning/CRIMAC-Visualization/`

`cd CRIMAC-Visualization`

## Build the image

`docker build --tag crimac-visualisation .`

## Start the container
Cheack first the IP address using `ifconfig`

Replace the drive to point to the data storage and check if the ports are available

`docker run --rm -it -d --name crimac-visualisation -v /localscratch_hdd/crimac/:/data/ -v /localscratch_hdd/nilsolav/:/scratch/ -p 8089:8089 crimac-visualisation:latest`

`docker exec -it <id> zsh`

## Run notebook on Pallas

`jupyter-notebook --ip=0.0.0.0 --port=8089 --no-browser --allow-root`

When accessing the notebook you need to use the IP address for the server. Check the IP addresses using, e.g. `host <hostname>` or `host pallas` and copy your access token to this string:

`http://10.1.100.162:8089/?token=<accesstoken>`
