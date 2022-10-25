FROM pytorch/pytorch:latest

RUN mkdir /install
WORKDIR /install
RUN apt-get update
RUN apt-get -qq -y install git emacs zsh wget curl sudo
# plotly jupyter-dash dash pandas anaconda ipywidgets
RUN conda install -c conda-forge jupyterlab plotly pandas ipywidgets xarray zarr dask pyarrow fastparquet matplotlib scipy scikit-learn PyYAML numpy
RUN conda install -c numcodecs tqdm tensorboard

# Install Rstox
#RUN r install.packages("RstoxBase", repos = c("https://stoxproject.github.io/repo", "https://cloud.r-project.org"))
#RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create ans switch to user
RUN useradd --create-home --shell /bin/zsh a39083
USER a39083
# Install Oh-My-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install emacs+elpy
#COPY .emacs /home/nilsolav/.emacs
RUN cd ~
#RUN mkdir repos
#RUN cd repos
#RUN git clone https://github.com/CRIMAC-WP4-Machine-learning/CRIMAC-Visualization/
#RUN cd CRIMAC-Visualization
# RUN jupyter-notebook --ip=0.0.0.0 --port=8089 --no-browser --allow-root

#RUN wget https://github.com/CRIMAC-WP4-Machine-learning/CRIMAC-Visualization/blob/main/ReadSandEelData.ipynb

CMD zsh

