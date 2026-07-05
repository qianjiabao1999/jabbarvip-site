# JabbarVIP Site

JabbarVIP 是一个纯静态站点，正式运行在 GitHub Pages，不需要 VPS 或服务器进程。

## 正式地址

https://qianjiabao1999.github.io/jabbarvip-site/

## 部署方式

GitHub Pages 已配置为从 `main` 分支根目录发布：

- 仓库：`qianjiabao1999/jabbarvip-site`
- 分支：`main`
- 目录：`/`
- HTTPS：已开启

提交并推送后，GitHub Pages 会自动重新构建。

```bash
./deploy.sh "更新说明"
```

演练模式只查看将要提交的改动：

```bash
./deploy.sh -n "更新说明"
```

## 本地预览

```bash
python3 -m http.server 8080
```

然后打开：

```text
http://127.0.0.1:8080/
```
