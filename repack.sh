#!/bin/bash

###########################################
# 打包脚本 - OpenAI4J Service
# 功能：构建项目并部署到Wintouch开发环境
# 作者：zeeker
# 日期：2024-03-18
###########################################

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}开始构建 OpenAI4J Service...${NC}"

# 获取项目版本号
echo -e "${YELLOW}获取项目版本号...${NC}"
VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo "当前版本: ${VERSION}"

# 执行Maven打包
echo -e "\n${YELLOW}执行Maven打包...${NC}"
mvn clean package

# 检查打包是否成功
if [ $? -ne 0 ]; then
    echo -e "\n${RED}构建失败，请检查错误信息${NC}"
    exit 1
fi

# 显示构建产物
echo -e "\n${YELLOW}构建产物列表：${NC}"
ls -lh service/target/*.jar

# 定义目标目录
TARGET_DIR=~/Public/workspace/wintouch/dev_wintouch8/WebContent/WEB-INF/lib
JARFILE="openai4j-service-${VERSION}-fat.jar"

# 复制文件到目标目录
echo -e "\n${YELLOW}部署到Wintouch开发环境...${NC}"
if [ -f "service/target/${JARFILE}" ]; then
    cp "service/target/${JARFILE}" "${TARGET_DIR}"
    echo -e "${GREEN}部署成功：${JARFILE}${NC}"
else
    echo -e "${RED}错误：找不到构建产物 ${JARFILE}${NC}"
    exit 1
fi

echo -e "\n${GREEN}构建和部署完成！${NC}"
