# go-vim
## 用途
这是一个golang 的 ide,它集成了 vim + vim-go 等一系列的插件,详细的内容[单击此处](https://segmentfault.com/a/1190000017270664).</br>
安装包使用docker进行了封装,最终打包成了镜像,即整个IDE是运行在docker 容器内的,它依赖于docker 服务。

## 安装部署
### ubuntu
1. 克隆此项目到本地：
  ```
    git clone https://github.com/redresseur/go-vim.git
  ```
2. 进入工程目录,配置工程目录：
  ```
    cd $go-vim
    vim go_vim.conf
  ```
  填入本地的gopath目录和go工程目录：
  ```
    GOPATH=xxx
    LOCALDIR=xxx
  ```
  ps: 在镜像中集成了 golang 1.12.5 开发环境, 在该版本中支持go module 管理模式, 建议使用该管理工具,所以拆分为 $GOPATH 和 $LOCALDIR 两个部分.

3. 执行安装脚本：
  ```
    sudo bash install.sh
  ```
  执行安装命令后,会在本地注册一个 go_vim.service, 安装后使用：
  ```
    systemctl status go_vim 
  ```
  查看当前服务状态:
  ```
    o_vim.service - Golang+Vim IDE
     Loaded: loaded (/lib/systemd/system/go_vim.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2019-05-10 17:40:16 CST; 30min ago
   Main PID: 22909 (go_vim.sh)
      Tasks: 8 (limit: 4915)
     CGroup: /system.slice/go_vim.service
             ├─22909 /bin/bash /usr/local/bin/go_vim.sh /home/gopher/workspace/gopath /home/gopher/workspace/project
             └─22920 docker run -v go_vim_root:/root ...
  ```
 
 ## IDE使用
 1. 进入容器
  ```
    docker exec -u 1040:11030 -it go_vim bash
  ```
 2. 打开项目
 
   ```
      vim xxx/$project
   ```
   按F9 可以列出 当前文件的接口和函数, 按 F7可以列出工程结构，其他请参考详细内容.
 
 ## 注意事项
 
 在启动服务成功后 `docker ps` 可以看见一个 命名为 go_vim 的容器, 这个容器不要手动删除, 此外也不要删除 docker 的 go_vim_etc、
 go_vim_root、go_vim_usr、go_vim_var 卷, 如果删除了这些卷,在容器内 `apt-get` 安装部署的环境会全部删除掉.</br>
 
 安装的时候请保持网络的畅通, 否则拉取镜像很可能失败, 此外为了使调试更加方便, 创建容器的时候使用的是 host 模式. 为了保证安全,
 建议使用默认的gopher 用户登录.
 
 

 
