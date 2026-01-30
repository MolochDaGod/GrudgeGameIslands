@echo off
echo ========================================
echo  Grudge Warlords - Deployment Helper
echo ========================================
echo.

:menu
echo Select deployment option:
echo.
echo 1. Setup GitHub Remote
echo 2. Commit and Push Changes
echo 3. Deploy to Vercel
echo 4. Full Deploy (Commit + Push + Vercel)
echo 5. Exit
echo.
set /p choice="Enter choice (1-5): "

if "%choice%"=="1" goto setup_github
if "%choice%"=="2" goto commit_push
if "%choice%"=="3" goto deploy_vercel
if "%choice%"=="4" goto full_deploy
if "%choice%"=="5" goto end
goto menu

:setup_github
echo.
echo ========================================
echo  Setup GitHub Remote
echo ========================================
echo.
set /p username="Enter your GitHub username: "
set /p reponame="Enter repository name (default: GrudgeWarlords): "
if "%reponame%"=="" set reponame=GrudgeWarlords

echo.
echo Adding remote: https://github.com/%username%/%reponame%.git
git remote add origin https://github.com/%username%/%reponame%.git

echo.
echo Verifying remote...
git remote -v

echo.
echo Done! Now create the repository on GitHub:
echo https://github.com/new
echo.
pause
goto menu

:commit_push
echo.
echo ========================================
echo  Commit and Push Changes
echo ========================================
echo.
set /p message="Enter commit message: "
if "%message%"=="" set message="Update: Latest changes"

echo.
echo Staging all changes...
git add .

echo.
echo Committing...
git commit -m "%message%

Co-Authored-By: Warp <agent@warp.dev>"

echo.
echo Pushing to GitHub...
git push

echo.
echo Done!
pause
goto menu

:deploy_vercel
echo.
echo ========================================
echo  Deploy to Vercel
echo ========================================
echo.
echo Checking if Vercel CLI is installed...
where vercel >nul 2>nul
if %errorlevel% neq 0 (
    echo Vercel CLI not found!
    echo Installing Vercel CLI...
    npm install -g vercel
)

echo.
echo 1. Deploy to Preview
echo 2. Deploy to Production
echo.
set /p deploy_type="Select deployment type (1-2): "

if "%deploy_type%"=="1" (
    echo.
    echo Deploying to preview...
    vercel
) else (
    echo.
    echo Deploying to production...
    vercel --prod
)

echo.
echo Done!
pause
goto menu

:full_deploy
echo.
echo ========================================
echo  Full Deployment
echo ========================================
echo.
set /p message="Enter commit message: "
if "%message%"=="" set message="Update: Latest changes"

echo.
echo [1/4] Staging all changes...
git add .

echo.
echo [2/4] Committing...
git commit -m "%message%

Co-Authored-By: Warp <agent@warp.dev>"

echo.
echo [3/4] Pushing to GitHub...
git push

echo.
echo [4/4] Deploying to Vercel...
where vercel >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing Vercel CLI...
    npm install -g vercel
)

vercel --prod

echo.
echo ========================================
echo  Deployment Complete!
echo ========================================
echo.
echo Your game is now:
echo - Committed to Git
echo - Pushed to GitHub
echo - Deployed to Vercel
echo.
echo Check Vercel dashboard for live URL!
echo.
pause
goto menu

:end
echo.
echo Goodbye!
exit
