wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
echo Successful setup authtoken
./ngrok authtoken $CRP
echo install disk
wget https://software.download.prss.microsoft.com/dbazure/Win10_21H2_English_x64.iso?t=b4baacf1-c76f-44fb-ad9d-27e8ecb0f6fe&e=1658503753&h=67b339bf5e3231ef336d2c1a75b53274e006d0397a2af9b3f5679b4ba6905fe2
nohup ./ngrok tcp 5900
echo "install qemu" 1~3 Min
sudo apt install qemu-system-x86
echo Your VNC IP Address: curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 -vnc :0 -hda Win10_21H2_English_x64.iso -smp cores=8 -m 8192M -machine usb=on -device usb-tablet > /dev/null 2>&1
