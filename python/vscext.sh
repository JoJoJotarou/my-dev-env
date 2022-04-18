#!/bin/bash

# 需要安装的插件的UID
param=(
    ms-ceintl.vscode-language-pack-zh-hans
    ms-python.python
    ms-python.vscode-pylance
    mhutchie.git-graph
    gruntfuggly.todo-tree
    njpwerner.autodocstring
    deerawan.vscode-dash
    hbenl.vscode-test-explorer
)

# 获取已安装的插件uid
installed=$(code --list-extensions | tail -n +2)

for item in ${param[*]}; do

    if [ "$1" != null ]; then
        if [[ ! "${installed[@],,}" =~ "${item,,}" ]]; then
            echo "$item not exists"
            code --install-extension "${item}"
        fi
    fi
done
