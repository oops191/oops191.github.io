# Cloudflare Pages 部署指南

本项目可以通过 Cloudflare Pages 部署。

## 部署步骤

### 方法一：通过 Cloudflare Dashboard（推荐）

1. **准备 Git 仓库**
   - 将项目推送到 GitHub、GitLab 或 Bitbucket
   - 确保所有文件都已提交

2. **登录 Cloudflare**
   - 访问 [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - 进入 "Workers & Pages" 部分

3. **创建新项目**
   - 点击 "Create application"
   - 选择 "Pages" 标签
   - 点击 "Connect to Git"

4. **连接仓库**
   - 授权 Cloudflare 访问你的 Git 仓库
   - 选择 Frosti 项目仓库

5. **配置构建设置**
   ```
   Framework preset: Astro
   Build command: pnpm run build
   Build output directory: dist
   Root directory: /
   ```

6. **环境变量**（如果需要）
   - 通常不需要额外的环境变量
   - 如果使用了 API keys，在这里添加

7. **部署**
   - 点击 "Save and Deploy"
   - 等待构建完成（通常需要 2-5 分钟）

### 方法二：通过 Wrangler CLI

1. **安装 Wrangler**
   ```bash
   pnpm add -D wrangler
   ```

2. **登录 Cloudflare**
   ```bash
   pnpm wrangler login
   ```

3. **部署**
   ```bash
   pnpm run build
   pnpm wrangler pages deploy dist
   ```

## 构建配置

### Node.js 版本
项目使用 Node.js 20（已在 `.node-version` 文件中指定）

### 包管理器
推荐使用 `pnpm`，Cloudflare Pages 会自动检测

### 构建命令
```bash
pnpm run build
```

这个命令会：
1. 运行 Astro 类型检查
2. 构建 Astro 项目
3. 生成 Pagefind 搜索索引

### 输出目录
```
dist/
```

## 自动部署

连接 Git 仓库后，每次推送到主分支都会自动触发部署：
- **生产环境**：推送到 `main` 或 `master` 分支
- **预览环境**：推送到其他分支或 Pull Request

## 自定义域名

1. 在 Cloudflare Pages 项目设置中
2. 进入 "Custom domains"
3. 添加你的域名
4. 按照提示配置 DNS 记录

## 环境变量（如果需要）

在 Cloudflare Pages 项目设置中：
1. 进入 "Settings" > "Environment variables"
2. 添加所需的环境变量
3. 可以为生产环境和预览环境设置不同的值

## 性能优化

Cloudflare Pages 自动提供：
- ✅ 全球 CDN 分发
- ✅ 自动 HTTPS
- ✅ 无限带宽
- ✅ DDoS 防护
- ✅ 自动缓存优化

## 故障排查

### 构建失败
1. 检查 Node.js 版本是否正确（应为 20）
2. 确保 `package.json` 中的依赖完整
3. 查看构建日志中的错误信息

### 页面无法访问
1. 检查构建输出目录是否为 `dist`
2. 确保 `dist` 目录中有 `index.html`
3. 检查 Astro 配置中的 `site` 和 `base` 设置

### 搜索功能不工作
1. 确保构建命令包含 `pagefind --site dist`
2. 检查 `dist/pagefind` 目录是否存在

## 有用的链接

- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Astro 部署指南](https://docs.astro.build/en/guides/deploy/cloudflare/)
- [Cloudflare Dashboard](https://dash.cloudflare.com/)
