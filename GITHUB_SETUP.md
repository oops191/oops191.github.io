# 🐙 GitHub + Cloudflare Pages 完整部署指南

## 第 1 步：创建 GitHub 仓库

### 1.1 访问 GitHub
打开浏览器访问：https://github.com/new

### 1.2 创建新仓库
填写以下信息：

```
Repository name: frosti-blog (或你喜欢的名字)
Description: 我的个人博客 - 基于 Frosti 模板
Visibility: Public (公开) 或 Private (私有，都可以)

不要勾选：
❌ Add a README file
❌ Add .gitignore
❌ Choose a license
```

点击 **Create repository**

### 1.3 记录仓库地址
创建后会看到类似这样的地址：
```
https://github.com/oops191/frosti-blog.git
```

## 第 2 步：推送代码到 GitHub

### 2.1 打开终端（PowerShell）

在项目目录 `d:\Frosti` 中打开终端

### 2.2 初始化 Git（如果还没有）

```bash
# 检查是否已经初始化
git status

# 如果提示 "not a git repository"，则初始化
git init
```

### 2.3 配置 Git 用户信息（首次使用）

```bash
# 设置用户名
git config --global user.name "oops191"

# 设置邮箱（使用你的 GitHub 邮箱）
git config --global user.email "your-email@example.com"
```

### 2.4 添加所有文件

```bash
git add .
```

### 2.5 提交代码

```bash
git commit -m "Initial commit: Frosti blog ready for deployment"
```

### 2.6 添加远程仓库

```bash
# 替换为你的仓库地址
git remote add origin https://github.com/oops191/frosti-blog.git

# 如果已经添加过，可以先删除再添加
git remote remove origin
git remote add origin https://github.com/oops191/frosti-blog.git
```

### 2.7 推送到 GitHub

```bash
# 推送到 main 分支
git push -u origin main

# 如果提示需要认证，使用 Personal Access Token
# 或者使用 GitHub Desktop 更方便
```

### 2.8 验证推送成功

访问你的 GitHub 仓库页面，应该能看到所有文件。

## 第 3 步：在 Cloudflare Pages 连接仓库

### 3.1 授权 GitHub

在你看到的 Cloudflare Pages 页面：

1. 确保已选择 **oops191** 账号
2. 如果没有看到仓库列表，点击 **Add account** 或 **Configure GitHub**
3. 在弹出的 GitHub 授权页面：
   - 选择 **All repositories** 或 **Only select repositories**
   - 如果选择后者，勾选 `frosti-blog`
   - 点击 **Install & Authorize**

### 3.2 选择仓库

回到 Cloudflare Pages：
1. 在搜索框中输入 `frosti` 或 `blog`
2. 找到你的 `frosti-blog` 仓库
3. 点击仓库名称

### 3.3 配置构建设置

在 "Set up builds and deployments" 页面：

```
项目名称: frosti-blog
生产分支: main

Framework preset: Astro
Build command: pnpm run build
Build output directory: dist
Root directory: (留空)
```

### 3.4 开始部署

点击 **Save and Deploy**

## 第 4 步：等待部署完成

### 4.1 查看构建日志

部署开始后，你会看到：
- ⏳ Initializing build environment
- 📦 Cloning repository
- 📥 Installing dependencies
- 🔨 Building application
- 📤 Deploying to Cloudflare's global network

通常需要 2-5 分钟。

### 4.2 部署成功

看到 ✅ 成功标志后，会显示你的网站 URL：
```
https://frosti-blog.pages.dev
```

点击链接即可访问你的博客！

## 🔄 后续更新流程

每次更新博客内容：

```bash
# 1. 修改文件（添加新文章、修改配置等）

# 2. 提交更改
git add .
git commit -m "添加新文章"

# 3. 推送到 GitHub
git push

# 4. Cloudflare Pages 自动检测并重新部署（无需手动操作）
```

## 🛠️ 使用 GitHub Desktop（推荐新手）

如果命令行操作不熟悉，可以使用 GitHub Desktop：

### 下载安装
https://desktop.github.com/

### 使用步骤
1. 打开 GitHub Desktop
2. File → Add Local Repository → 选择 `d:\Frosti`
3. 点击 "Publish repository"
4. 选择账号和仓库名称
5. 点击 "Publish repository"

之后每次更新：
1. 在 GitHub Desktop 中查看更改
2. 填写 commit 信息
3. 点击 "Commit to main"
4. 点击 "Push origin"

## ⚠️ 常见问题

### 问题 1：推送时要求输入密码

**解决方案：使用 Personal Access Token**

1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 生成并复制 token
5. 推送时用 token 替代密码

### 问题 2：在 Cloudflare 看不到仓库

**解决方案：**
1. 确保仓库已成功推送到 GitHub
2. 在 Cloudflare Pages 点击 "Add account"
3. 重新授权 GitHub
4. 确保选择了正确的仓库权限

### 问题 3：构建失败

**检查项：**
1. 确保 `.node-version` 文件存在
2. 确保构建命令为 `pnpm run build`
3. 确保输出目录为 `dist`
4. 查看构建日志中的具体错误

### 问题 4：首次推送失败

```bash
# 如果提示 "failed to push some refs"
# 先拉取远程更改
git pull origin main --allow-unrelated-histories

# 然后再推送
git push -u origin main
```

## 📊 部署状态检查

### 在 GitHub 查看
访问：https://github.com/oops191/frosti-blog

应该能看到：
- ✅ 所有项目文件
- ✅ 最近的 commit 记录
- ✅ Cloudflare Pages 的部署状态徽章（可选）

### 在 Cloudflare 查看
访问：https://dash.cloudflare.com/

在 Workers & Pages 中：
- ✅ 看到你的项目
- ✅ 查看部署历史
- ✅ 查看访问统计

## 🎉 完成！

现在你的博客已经：
- ✅ 托管在 GitHub
- ✅ 部署在 Cloudflare Pages
- ✅ 自动化部署流程
- ✅ 全球 CDN 加速

每次更新只需：`git add . && git commit -m "更新" && git push`

---

**需要帮助？**
- GitHub 文档：https://docs.github.com/
- Cloudflare Pages 文档：https://developers.cloudflare.com/pages/
