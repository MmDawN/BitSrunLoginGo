#!/bin/bash

# 自动编译Go程序
echo "Compiling Go program..."
go build -o BitSrunLoginGo ./cmd/bitsrun/main.go

# 创建目录结构
mkdir -p package/DEBIAN
mkdir -p package/usr/local/bin

# 复制可执行文件和systemd服务文件
cp BitSrunLoginGo package/usr/local/bin/

# 设置正确的目录权限
chmod 755 package/DEBIAN

# 创建deb包
dpkg-deb --build package bitsrunlogingo_1.0_amd64.deb

echo "Deb package created successfully."