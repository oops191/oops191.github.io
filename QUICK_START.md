# 🚀 快速开始 - GitHub + Cloudflare 部署

## ✅ 已修复编码问题

由于 PowerShell 脚本的编码问题，我已经创建了批处理文件（.bat）来代替。

## 📦 现在开始部署

### 第 1 步：设置 GitHub（5 分钟）

**双击运行：`setup-github.bat`**

或在命令行（CMD 或 PowerShell）运行：
```bash
setup-github.bat
```

脚本会引导你：
1. 配置 Git 用户名和邮箱
2. 初始化 Git 仓库
3. 添加 GitHub 远程仓库地址
4. 首次提交并推送代码

**需要准备：**
- GitHub 仓库地址（先在 https://github.com/new 创建）
- 格式：`https://github.com/oops191/frosti-blog.git`

### 第 2 步：连接 Cloudflare（5 分钟）

1. 访问：https://dash.cloudflare.com/
2. Workers & Pages → Create → Pages → Connect to Git
3. 授权 GitHub 并选择你的仓库
4. 配置构建设置：
   ```
   Framework: Astro
   Build command: pnpm run build
   Output directory: dist
   ```
5. 点击 "Save and Deploy"

### 第 3 步：等待部署（2-5 分钟）

部署成功后会得到网站 URL：
```
https://你的项目名.pages.dev
```

## 🔄 以后更新博客

**双击运行：`deploy.bat`**

或在命令行：
```bash
deploy.bat "添加新文章"
```

脚本会自动：
1. 构建项目
2. 提交更改
3. 推送到 GitHub
4. Cloudflare 自动部署

## 📝 手动操作（如果脚本不工作）

### 首次设置
```bash
# 1. 配置 Git
git config --global user.name "oops191"
git config --global user.email "your-email@example.com"

# 2. 初始化仓库
git init

# 3. 添加远程仓库（替换为你的地址）
git remote add origin https://github.com/oops191/frosti-blog.git

# 4. 提交并推送
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

### 日常更新
```bash
git add .
git commit -m "更新内容"
git push
```

## ⚠️ 常见问题

### Q: 推送时要求密码？
**A:** 使用 Personal Access Token（不是 GitHub 密码）
1. 访问：https://github.com/settings/tokens
2. Generate new token (classic)
3. 勾选 `repo` 权限
4. 复制 token
5. 推送时用 token 作为密码

### Q: 批处理文件无法运行？
**A:** 
1. 右键文件 → 属性 → 解除锁定
2. 或在 CMD 中运行（不要用 PowerShell）
3. 或直接使用手动命令

### Q: Cloudflare 看不到仓库？
**A:**
1. 确保代码已推送到 GitHub
2. 在 Cloudflare 重新授权 GitHub
3. 检查仓库权限设置

## 📚 详细文档

- **GITHUB_SETUP.md** - GitHub 详细教程
- **CLOUDFLARE_DEPLOY.md** - Cloudflare 详细教程
- **git-commands.md** - Git 命令参考

## 🎯 当前状态

✅ 项目构建成功（17 个页面）
✅ 7 篇博客文章
✅ 批处理脚本已创建
⏳ 等待推送到 GitHub
⏳ 等待连接 Cloudflare

---

**立即开始：双击 `setup-github.bat`**
