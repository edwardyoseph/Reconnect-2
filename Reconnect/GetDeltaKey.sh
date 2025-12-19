#!/bin/bash

# Mengambil logcat dan mencari link yang sesuai dengan pola
logcat -d | grep -oP 'https://auth\.platorelay\.com/a\?d=[A-Za-z0-9]+(?:[A-Za-z0-9\-\_\.~%])+' > links.txt

# Menampilkan hasil yang ditemukan
echo "Link yang ditemukan:"
cat links.txt
