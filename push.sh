@echo off
cd /d %~dp0
git add -A
for /f "tokens=*" %%i in ('git diff --cached --stat') do set HAS_CHANGES=1
if not defined HAS_CHANGES (
    echo No changes to commit.
    exit /b 0
)
git commit -m "%~1"
git push origin main
echo Push complete.
