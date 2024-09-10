curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/dart-archive-keyring.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | tee /etc/apt/sources.list.d/dart_stable.list > /dev/null
apt-get update
apt-get install -y --no-install-recommends dart
git clone https://github.com/vickumar1981/jupyter-dart-kernel.git /opt/jupyter-dart-kernel
cd /opt/jupyter-dart-kernel && pip install .
jupyter kernelspec install /opt/jupyter-dart-kernel
ln -s /usr/bin/dart /usr/local/bin/dart