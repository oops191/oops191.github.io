# 🚀 Git 快速命令参考

## 📦 首次设置（只需执行一次）

### 1. 配置 Git 用户信息
```bash
git config --global user.name "oops191"
git config --global user.email "your-email@example.com"
```

### 2. 初始化仓库（如果还没有）
```bash
cd d:\Frosti
git init
```

### 3. 添加远程仓库
```bash
# 替换为你的 GitHub 仓库地址
git remote add origin https://github.com/oops191/frosti-blog.git
```

### 4. 首次推送
```bash
# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Frosti blog"

# 推送到 GitHub
git push -u origin main
```

如果提示分支名称问题：
```bash
# 重命名分支为 main
git branch -M main

# 再次推送
git push -u origin main
```

## 🔄 日常更新（每次修改后）

### 方式 1：一键推送（推荐）
```bash
git add . && git commit -m "更新博客内容" && git push
```

### 方式 2：分步操作
```bash
# 1. 查看修改了哪些文件
git status

# 2. 添加所有修改
git add .

# 3. 提交（修改 commit 信息）
git commit -m "添加新文章：置身事内"

# 4. 推送到 GitHub
git push
```

## 📝 常用 Commit 信息模板

```bash
# 添加新文章
git commit -m "添加新文章：文章标题"

# 修改配置
git commit -m "更新网站配置"

# 修复问题
git commit -m "修复：描述问题"

# 更新样式
git commit -m "优化页面样式"

# 删除内容
git commit -m "删除：描述删除的内容"
```

## 🔍 查看状态

```bash
# 查看当前状态
git status

# 查看提交历史
git log

# 查看最近 5 次提交
git log -5 --oneline

# 查看远程仓库信息
git remote -v
```

## 🌿 分支操作

```bash
# 查看所有分支
git branch -a

# 创建新分支
git branch dev

# 切换分支
git checkout dev

# 创建并切换到新分支
git checkout -b feature-new

# 合并分支到 main
git checkout main
git merge dev
```

## ⚠️ 问题解决

### 问题 1：推送被拒绝
```bash
# 先拉取远程更改
git pull origin main

# 如果有冲突，解决后再推送
git push
```

### 问题 2：撤销最后一次 commit
```bash
# 保留修改，撤销 commit
git reset --soft HEAD~1

# 完全撤销（慎用！）
git reset --hard HEAD~1
```

### 问题 3：放弃本地修改
```bash
# 放弃单个文件的修改
git checkout -- 文件名

# 放弃所有修改
git checkout .
```

### 问题 4：删除远程仓库连接
```bash
# 查看远程仓库
git remote -v

# 删除远程仓库连接
git remote remove origin

# 重新添加
git remote add origin https://github.com/oops191/frosti-blog.git
```

### 问题 5：修改最后一次 commit 信息
```bash
git commit --amend -m "新的 commit 信息"
```

## 🔐 GitHub 认证

### 使用 Personal Access Token

1. **生成 Token**
   - 访问：https://github.com/settings/tokens
   - 点击 "Generate new token (classic)"
   - 勾选 `repo` 权限
   - 生成并保存 token

2. **使用 Token**
   ```bash
   # 推送时输入：
   Username: oops191
   Password: 粘贴你的 token（不是 GitHub 密码）
   ```

3. **保存凭据（可选）**
   ```bash
   # Windows
   git config --global credential.helper wincred
   
   # 下次推送时输入 token，之后会自动保存
   ```

## 📋 完整工作流程

### 每次更新博客的完整步骤：

```bash
# 1. 进入项目目录
cd d:\Frosti

# 2. 创建或修改文章
# （在 src/content/blog/ 中编辑文件）

# 3. 本地测试（可选）
pnpm run build
pnpm run preview

# 4. 提交并推送
git add .
git commit -m "添加新文章"
git push

# 5. 等待 Cloudflare Pages 自动部署（1-2 分钟）
```

## 🎯 快捷命令别名（可选）

在 PowerShell 配置文件中添加：

```powershell
# 打开配置文件
notepad $PROFILE

# 添加以下内容：
function gitpush {
    param($message = "更新内容")
    git add .
    git commit -m $message
    git push
}

# 使用：
gitpush "添加新文章"
# 或直接：
gitpush
```

## 📚 学习资源

- [Git 官方文档](https://git-scm.com/doc)
- [GitHub 快速入门](https://docs.github.com/cn/get-started)
- [Git 可视化学习](https://learngitbranching.js.org/)

---

**提示：** 建议先在本地测试构建成功后再推送到 GitHub！

```bash
pnpm run build  # 确保构建成功
git push        # 然后推送
```
