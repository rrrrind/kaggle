FROM  python:3.8

RUN apt update && apt -y upgrade

# 以下はjupyterlabの拡張機能を使うための前処理(最新版のnode.jpのインストール)
RUN apt install -y nodejs npm curl
#RUN npm cache clean
RUN npm install n -g
RUN n stable
RUN ln -sf /usr/local/bin/node /usr/bin/node
RUN apt purge -y nodejs npm

# pythonのライブラリ
WORKDIR /home
COPY requirements.txt ${PWD}
RUN python3.8 -m pip install -r requirements.txt
# 多重対応分析
RUN python3.8 -m pip install --user mca

# jupyterlabの"Table of Contents"
RUN jupyter labextension install @jupyterlab/toc
# jupyterlabの"tqdm"
RUN pip3 install tqdm ipywidgets
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

# 作業ディレクトリ
WORKDIR /home/workspace
