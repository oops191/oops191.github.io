# OG 图片字体设置指南

## 问题
构建时出现 "No fonts are loaded" 错误，这是因为 Satori 需要字体文件来生成 OG 图片。

## 解决方案 1：下载本地字体（推荐）

1. 创建字体目录：
```bash
mkdir -p public/fonts
```

2. 下载 Noto Sans SC 字体：
   - 访问：https://fonts.google.com/noto/specimen/Noto+Sans+SC
   - 下载 Regular (400) 和 Bold (700) 两个字重
   - 将 .ttf 文件放到 `public/fonts/` 目录

3. 修改 `src/pages/og/[...slug].png.ts`，使用本地字体而不是从 Google Fonts 下载

## 解决方案 2：禁用 OG 图片生成

如果不需要 OG 图片功能，可以：

1. 删除或重命名 `src/pages/og/` 目录
2. 修改 `src/pages/blog/[...slug].astro`，移除 OG 图片相关代码

## 解决方案 3：使用系统字体

使用系统自带的字体，但可能不支持中文。
