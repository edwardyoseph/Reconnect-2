echo "Current License Key:"
if [ -f /storage/emulated/0/Delta/Internals/Cache/license ]; then
    cat /storage/emulated/0/Delta/Internals/Cache/license
else
    echo "License file not found, skipping cat."
fi
echo "  "
echo "Import New Delta Key:"
read new_key
echo "$new_key" > /storage/emulated/0/Delta/Internals/Cache/license
echo "Delta Key berhasil diimport!"
echo "  "
echo "Updated License Key:"
if [ -f /storage/emulated/0/Delta/Internals/Cache/license ]; then
    cat /storage/emulated/0/Delta/Internals/Cache/license
else
    echo "License file not found after import."
fi
echo "  "
echo "Please restart Delta to apply the new key."
