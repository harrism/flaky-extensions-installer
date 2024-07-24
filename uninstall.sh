vscode_server_base="/home/coder/.vscode-server/bin/"
vscode_server_id=$(ls -l "$vscode_server_base" | grep '^l' | awk '{print $9}' | head -n 1)
echo $vscode_server_id
vscode_server_cmd="/home/coder/.vscode-server/bin/${vscode_server_id}/bin/code-server --log debug --force-disable-user-env --server-data-dir /home/coder/.vscode-server --telemetry-level all --accept-server-license-terms --host 127.0.0.1 --port 0 --connection-token-file /home/coder/.vscode-server/data/Machine/.connection-token-${vscode_server_id} --extensions-download-dir /home/coder/.vscode-server/extensionsCache --uninstall-extension "

extensions="extensions.txt" 

while IFS= read -r extension; do
    eval "$vscode_server_cmd \"$extension\""
done < "$extensions"