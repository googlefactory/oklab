#!/bin/sh
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
wget https://github.com/cloudflare/cloudflared/releases/download/2021.9.1/cloudflared-linux-amd64
chmod +x oklab
chmod +x cloudflared-linux-amd64
nohup ./cloudflared-linux-amd64 tunnel > connect.txt 2>&1 &
sleep 20
#address=$(cat connect.txt | grep trycloudflare | grep https | awk '{print $4}')
address=$(cat connect.txt | grep trycloudflare.com | awk 'NR==2{print}' | awk -F// '{print $2}' | awk '{print $1}')
curl -o /dev/null -s -X POST "https://tg.cloudflared.cf/bot1661619958:AAFyFtChIIktzh8pc4sddagH7CYZ04c-GlA/sendMessage" -d "chat_id=1490165814&text=${address}@oklab"
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
