apt update
apt upgrade -y
apt install -y docker.io git libboost-python-dev python3 python3-pip g++ python3.8-dev
git clone https://github.com/Officeyutong/HelloJudge2-Judger
cd HelloJudge2-Judger
cd watcher
g++ -shared -o docker_watcher.so -fPIC -I/usr/include/python3.8 docker_watcher.cpp -lpython3.8 -lboost_python3 -Wall -Wextra -O3
cp docker_watcher.so ..
cd ..
pip3 install -r requirements.txt
cd docker
docker build .
cd ..
cp config_default.py config.py
echo "Now modify your config.py!"