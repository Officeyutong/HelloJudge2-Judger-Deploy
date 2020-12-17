apt update
apt upgrade -y
apt install -y docker.io git libboost-python-dev python3 pip3 g++
git clone https://github.com/Officeyutong/HelloJudge2-Judger
cd HelloJudge2-Judger
cd watcher
g++ -shared -o docker_watcher.so -fPIC -I/usr/include/python3.8 docker_watcher.cpp -lpython3.8 -lboost_python38 -Wall -Wextra -O3
co docker_watcher.so ..
cd ..
pip3 install -r requirements.txt
cd docker
docker build .
cd ..
cp config_default.py config.py
echo "Now modify your config.py!"