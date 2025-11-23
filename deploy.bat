@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM Get commit message from parameter or use default
set "COMMIT_MSG=%~1"
if "%COMMIT_MSG%"=="" set "COMMIT_MSG=Update blog content"

echo.
echo ========================================
echo   Deploying Frosti Blog
echo ========================================
echo.

REM Check if in correct directory
if not exist "package.json" (
    echo [ERROR] Please run this script in project root directory!
    pause
    exit /b 1
)

REM Step 1: Build
echo Step 1/4: Building project...
call pnpm run build

if %errorlevel% neq 0 (
    echo [ERROR] Build failed! Please check error messages.
    pause
    exit /b 1
)

echo [OK] Build successful!
echo.

REM Step 2: Add files
echo Step 2/4: Adding modified files...
git add .

if %errorlevel% neq 0 (
    echo [ERROR] Git add failed!
    pause
    exit /b 1
)

echo [OK] Files added!
echo.

REM Step 3: Commit
echo Step 3/4: Committing changes...
echo Commit message: %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"

if %errorlevel% neq 0 (
    echo [WARNING] No changes to commit, or commit failed.
) else (
    echo [OK] Commit successful!
)
echo.

REM Step 4: Push
echo Step 4/4: Pushing to GitHub...
git push

if %errorlevel% neq 0 (
    echo [ERROR] Push failed! Please check network and GitHub authentication.
    echo.
    echo Tips:
    echo 1. Make sure remote repository is configured
    echo 2. Check if you have push permission
    echo 3. Verify network connection
    pause
    exit /b 1
)

echo [OK] Push successful!
echo.

REM Complete
echo ========================================
echo   Deployment Complete!
echo ========================================
echo.
echo Next:
echo 1. Cloudflare Pages will auto-detect the update
echo 2. Wait 1-2 minutes for build to complete
echo 3. Visit your website to see changes
echo.
echo Cloudflare Dashboard: https://dash.cloudflare.com/
echo.
pause
