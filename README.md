read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP
./ngrok tcp 5900
echo Your VNC IP Address: curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 -vnc :0 -hda lite7.qcow2 -smp cores=8 -m 10894M -machine usb=on -device usb-tablet
