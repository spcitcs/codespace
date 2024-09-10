apt-get update
apt-get install python3 \
    python3-pip \
    python3-venv
pip3 install --no-cache-dir notebook jupyterlab setuptools jupyterdartkernel
ln -s /usr/bin/python3 /usr/bin/python