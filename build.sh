apt-get update
apt-get -y upgrade
apt-get install -y openssh-server

sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
apt-get install -y openjdk-7-jdk


docker run -d -p 5000:5000 --restart=always --name registry registry:2
git clone https://github.com/mkanade/test
cd test
docker build -t manuwela/test .
docker tag manuwela/test localhost:5000/test
docker push localhost:5000/test
