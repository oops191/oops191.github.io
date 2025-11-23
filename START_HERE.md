# 🚀 开始部署 - 从这里开始！

欢迎！这个文档会引导你完成整个部署流程。

## 📋 你需要什么

- ✅ GitHub 账号（免费）
- ✅ Cloudflare 账号（免费）
- ✅ 这个项目的代码（已有）
- ✅ Git 已安装（Windows 通常已自带）

## 🎯 三步部署流程

### 第 1 步：设置 GitHub 仓库

#### 方式 A：使用自动化脚本（推荐）

在项目目录打开 PowerShell，运行：

```powershell
.\setup-github.ps1
```

这个脚本会自动帮你：

- 配置 Git 用户信息
- 初始化 Git 仓库
- 添加远程仓库
- 首次提交并推送

#### 方式 B：手动操作

查看详细步骤：[GITHUB_SETUP.md](./GITHUB_SETUP.md)

或者快速命令：

```bash
# 1. 在 GitHub 创建新仓库
# 访问 https://github.com/new

# 2. 初始化并推送
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/你的用户名/仓库名.git
git push -u origin main
```

### 第 2 步：连接 Cloudflare Pages

1. **访问 Cloudflare**
   - 打开：https://dash.cloudflare.com/
   - 登录你的账号

2. **创建 Pages 项目**
   - Workers & Pages → Create → Pages
   - Connect to Git

3. **授权 GitHub**
   - 选择你的 GitHub 账号
   - 授权 Cloudflare 访问仓库

4. **选择仓库**
   - 在列表中找到你的 `frosti-blog` 仓库
   - 点击选择

5. **配置构建**

   ```
   Framework preset: Astro
   Build command: pnpm run build
   Build output directory: dist
   ```

6. **开始部署**
   - 点击 "Save and Deploy"
   - 等待 2-5 分钟

详细图文教程：[CLOUDFLARE_DEPLOY.md](./CLOUDFLARE_DEPLOY.md)

### 第 3 步：访问你的网站

部署成功后，你会得到一个 URL：

```
https://你的项目名.pages.dev
```

🎉 恭喜！你的博客已经上线了！

## 🔄 日常更新流程

### 方式 A：使用脚本（推荐）

```powershell
# 更新内容后运行
.\deploy.ps1 "添加新文章"
```

这个脚本会自动：

1. 构建项目
2. 提交更改
3. 推送到 GitHub
4. Cloudflare 自动部署

### 方式 B：手动命令

```bash
git add .
git commit -m "更新内容"
git push
```

查看所有命令：[git-commands.md](./git-commands.md)

## 📚 文档索引

| 文档                                           | 用途                      |
| ---------------------------------------------- | ------------------------- |
| **START_HERE.md**                              | 👈 你在这里！快速开始指南 |
| [GITHUB_SETUP.md](./GITHUB_SETUP.md)           | GitHub 详细设置教程       |
| [CLOUDFLARE_DEPLOY.md](./CLOUDFLARE_DEPLOY.md) | Cloudflare Pages 部署指南 |
| [git-commands.md](./git-commands.md)           | Git 常用命令参考          |
| [deploy-checklist.md](./deploy-checklist.md)   | 部署前检查清单            |
| [README_DEPLOY.md](./README_DEPLOY.md)         | 完整部署总结              |

## 🛠️ 可用脚本

| 脚本               | 用途             | 用法                      |
| ------------------ | ---------------- | ------------------------- |
| `setup-github.ps1` | 首次 GitHub 设置 | `.\setup-github.ps1`      |
| `deploy.ps1`       | 快速部署更新     | `.\deploy.ps1 "提交信息"` |

## ⚡ 快速命令参考

```bash
# 本地开发
pnpm run dev          # 启动开发服务器
pnpm run build        # 构建项目
pnpm run preview      # 预览构建结果

# Git 操作
git status            # 查看状态
git add .             # 添加所有更改
git commit -m "信息"  # 提交
git push              # 推送

# 一键部署
deploy.bat "更新内容"
```

## 🎯 当前项目状态

✅ **已完成：**

- 项目构建成功（17 个页面）
- 7 篇博客文章
- 搜索功能配置
- 部署配置文件

⏳ **待完成：**

- [ ] 创建 GitHub 仓库
- [ ] 推送代码到 GitHub
- [ ] 在 Cloudflare 创建 Pages 项目
- [ ] 连接 GitHub 仓库
- [ ] 完成首次部署

## 🆘 遇到问题？

### 常见问题

**Q: Git 推送时要求密码？**
A: 使用 Personal Access Token，详见 [GITHUB_SETUP.md](./GITHUB_SETUP.md#github-认证)

**Q: Cloudflare 看不到我的仓库？**
A: 检查 GitHub 授权设置，确保选择了正确的仓库

**Q: 构建失败？**
A: 查看构建日志，确保配置正确（Node.js 20, pnpm, dist 目录）

**Q: 网站显示 404？**
A: 检查输出目录是否为 `dist`，确保构建成功

更多问题查看：

- [GITHUB_SETUP.md - 常见问题](./GITHUB_SETUP.md#常见问题)
- [CLOUDFLARE_DEPLOY.md - 故障排查](./CLOUDFLARE_DEPLOY.md#故障排查)

## 💡 提示

1. **首次部署前**，建议先在本地测试：

   ```bash
   pnpm run build
   pnpm run preview
   ```

2. **推送前检查**，确保没有敏感信息：

   ```bash
   git status
   ```

3. **使用脚本**可以避免很多手动操作的错误

4. **保存 Token**，避免每次推送都要输入

## 🎓 学习资源

- [Git 基础教程](https://git-scm.com/book/zh/v2)
- [GitHub 快速入门](https://docs.github.com/cn/get-started)
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Astro 文档](https://docs.astro.build/)

## 📞 获取帮助

- GitHub Issues: 在你的仓库创建 Issue
- Cloudflare Community: https://community.cloudflare.com/
- Astro Discord: https://astro.build/chat

---

## 🚀 准备好了吗？

### 立即开始：

1. **运行设置脚本**

   双击 `setup-github.bat` 或在命令行运行：

   ```bash
   setup-github.bat
   ```

2. **访问 Cloudflare**
   https://dash.cloudflare.com/

3. **按照提示完成部署**

**预计时间：10-15 分钟**

---

**祝你部署顺利！🎉**

有问题随时查看相关文档或寻求帮助。
