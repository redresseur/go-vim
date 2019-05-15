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
  或
  下载release 版本解压缩到本地（建议采用这种方式）
2. 进入工程目录,配置工程目录：
  ```
    cd $go-vim
    vim go_vim.conf
  ```
  填入本地的gopath目录和go工程目录：
  ```
    GOPATH=xxx
    LOCALDIR=xxx
    USERID=xxx
    GROUPID=xxx
  ```
  其中GOPATH是本地的GOPATH目录，LOCALDIR就是常用的工程目录，USERID 是本地常用用户的 id，GROUPID 是本地常用用户的 组id，可以在 shell中执行 `id` 命令获取：
  ```
  uid=1000(gopher) gid=1000(gopher) 组=1000(gopher),999(docker)

  ```
  建议填入在LOCALDIR和GOPATH中有 `rw` 权限的本地用户的 uid 和 groupid.
  ps: 在镜像中集成了 golang 1.12.5 开发环境, 在该版本中支持go module 管理模式, 建议使用该管理工具,所以拆分为 $GOPATH 和 $LOCALDIR 两个部分.

3. 构造本地镜像：
```
  cd $go-vim/build
  docker build  --build-arg  uid=xxx --build-arg gid=xxx -t luckydogchian/go_vim:latest ./
```
其中的 uid 与 gid 与上面填入 go_vim.conf 中保持一致.

4. 执行安装脚本：
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
    go_vim.sh open ./
  ```
 2. 打开项目
 
   ```
      vim xxx/$project
   ```
   按F4 可以列出 当前文件的接口和函数, 按 F7可以列出工程结构，其他功能集成了 fatih/vim-go, 调试等操作请参考[详细内容](https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt).</br>
 
 ## 其他
 
 + 镜像中集成了 git 工具，其他缺失的工具可以在镜像中执行 `apt-get install` 进行安装，也可以将它集成在 DockerFile中（建议使用这种做法）;
 + 在自己更新了镜像之后要先执行 `systemctl stop go_vim`来停止服务，然后使用 `docker volume prune -f` 来清除历史卷，最后再执行 `systemctl start go_vim` ，如果没有更新镜像，不需要做此操作，仅仅执行`systemctl restart go_vim` 即可.
 
 ## 注意事项
 
 在启动服务成功后 `docker ps` 可以看见一个 命名为 go_vim 的容器, 这个容器不要手动删除, 此外也不要删除 docker 的 go_vim_etc、
 go_vim_root、go_vim_usr、go_vim_var 卷, 如果删除了这些卷,在容器内 `apt-get` 安装部署的环境会全部删除掉.</br>
 
 安装的时候请保持网络的畅通, 否则拉取镜像很可能失败, 此外为了使调试更加方便, 创建容器的时候使用的是 host 模式. 为了保证安全,
 建议使用默认的gopher 用户登录.
 
 

 
