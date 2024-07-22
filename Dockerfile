# 使用最新的vocechat-server镜像作为基础
FROM privoce/vocechat-server:latest

# 设置工作目录
WORKDIR /home/vocechat-server

# 使用root用户运行后续命令
USER root

# 安装配置文件，确保使用root权限执行
RUN --mount=type=secret,id=CONFIG,mode=0444,required=true \
    cat /run/secrets/CONFIG | sh

# 暴露3000端口，VoceChat服务器默认端口
EXPOSE 3000

# 以root用户身份运行VoceChat服务器
CMD ["sh", "-c", "exec ./vocechat-server"]
