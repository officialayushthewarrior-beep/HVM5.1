apt update -y
apt install git -y

git clone https://github.com/officialayushthewarrior-beep/HVM5.1
cd HVM5.1

apt update
apt install python3-pip -y

mkdir -p ~/.config/pip
echo -e "[global]\nbreak-system-packages = true" > ~/.config/pip/pip.conf

pip install -r requirements.txt

cat <<EOF > /etc/systemd/system/hvm.service
[Unit]
Description=HVM Panel (Discord Bot)
After=network.target

[Service]
User=root
WorkingDirectory=/root/hvm
ExecStart=/usr/bin/python3 /root/hvm/hvm.py
Restart=always
RestartSec=5
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
EOF

python3 hvm-5.1.py
