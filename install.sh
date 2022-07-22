sudo apt-get update && apt-get install qemu -y
clear
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip
clear
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
echo Successful setup authtoken
./ngrok authtoken $CRP
clear
echo "Install QEMU"
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
clear
echo install disk
wget -O 8.iso 'https://www.dropbox.com/s/qkl9md34406oplb/Windows_8.1_U3_x86_Lite.iso?dl=1'
qemu-img create -f raw 8.img 64G
clear
echo "Install Storage"
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
./ngrok tcp 5900
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 -vnc :0 -boot order=d -hda 8.iso -hdb 8.img -hdc RTL8139F.iso -cpu core2dou -smp cores=8 -m 8192M -machine usb=on -device usb-tablet
