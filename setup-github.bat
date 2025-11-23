@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   GitHub Setup
echo ========================================
echo.

REM Check if in correct directory
if not exist "package.json" (
    echo [ERROR] Please run this script in project root directory!
    pause
    exit /b 1
)

echo Step 1: Configure Git user info
echo.

REM Get current Git config
for /f "delims=" %%i in ('git config --global user.name 2^>nul') do set CURRENT_NAME=%%i
for /f "delims=" %%i in ('git config --global user.email 2^>nul') do set CURRENT_EMAIL=%%i

if defined CURRENT_NAME (
    echo Current config:
    echo   Username: %CURRENT_NAME%
    echo   Email: %CURRENT_EMAIL%
    echo.
    set /p CHANGE="Change config? (y/N): "
    if /i "%CHANGE%"=="y" goto CONFIG_USER
) else (
    goto CONFIG_USER
)

goto INIT_REPO

:CONFIG_USER
set /p USERNAME="Enter GitHub username: "
set /p EMAIL="Enter GitHub email: "
git config --global user.name "%USERNAME%"
git config --global user.email "%EMAIL%"
echo [OK] User info configured!
echo.

:INIT_REPO
echo Step 2: Initialize Git repository
echo.

if exist ".git" (
    echo [OK] Git repository already exists
) else (
    git init
    echo [OK] Git repository initialized
)
echo.

echo Step 3: Configure remote repository
echo.

REM Check if remote exists
git remote get-url origin >nul 2>&1
if %errorlevel%==0 (
    for /f "delims=" %%i in ('git remote get-url origin') do set CURRENT_REMOTE=%%i
    echo Current remote: !CURRENT_REMOTE!
    echo.
    set /p CHANGE_REMOTE="Change remote? (y/N): "
    if /i "%CHANGE_REMOTE%"=="y" (
        git remote remove origin
        goto ADD_REMOTE
    )
) else (
    goto ADD_REMOTE
)

goto COMMIT

:ADD_REMOTE
echo.
echo Enter your GitHub repository URL
echo Format: https://github.com/username/repo-name.git
echo Example: https://github.com/oops191/frosti-blog.git
echo.
set /p REPO_URL="Repository URL: "
git remote add origin "%REPO_URL%"
echo [OK] Remote repository configured!
echo.

:COMMIT
echo Step 4: Commit and push
echo.

REM Check if there are changes
git status --porcelain >nul 2>&1
if %errorlevel%==0 (
    set /p DO_COMMIT="Commit and push now? (Y/n): "
    if /i not "%DO_COMMIT%"=="n" (
        echo.
        echo Adding files...
        git add .
        
        echo Committing...
        git commit -m "Initial commit: Frosti blog ready for deployment"
        
        echo Setting default branch to main...
        git branch -M main
        
        echo Pushing to GitHub...
        echo.
        echo [NOTE] If prompted for password, use Personal Access Token
        echo        Get token at: https://github.com/settings/tokens
        echo.
        git push -u origin main
        
        if %errorlevel%==0 (
            echo.
            echo [OK] Push successful!
        ) else (
            echo.
            echo [ERROR] Push failed!
            echo.
            echo Possible reasons:
            echo 1. Need GitHub Personal Access Token
            echo 2. Incorrect repository URL
            echo 3. Network connection issue
            echo.
            echo See GITHUB_SETUP.md for help
        )
    )
)

echo.
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Visit https://dash.cloudflare.com/
echo 2. Create Pages project and connect GitHub
echo 3. Configure build settings
echo.
echo For updates, use: deploy.bat "commit message"
echo.
pause
