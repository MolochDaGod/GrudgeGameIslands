# 🚀 Deployment Guide - GitHub & Vercel

This guide will walk you through deploying **Grudge Warlords** to GitHub and Vercel.

## 📋 Prerequisites

- [ ] GitHub account ([create one here](https://github.com/join))
- [ ] Git installed (already done ✅)
- [ ] Vercel account ([sign up here](https://vercel.com/signup))

## 🐙 Step 1: Push to GitHub

### Create GitHub Repository

1. **Go to GitHub**: https://github.com/new

2. **Repository Settings**:
   - **Name**: `GrudgeWarlords` (or your preferred name)
   - **Description**: "3D Action RPG with 7 playable character races"
   - **Visibility**: Public or Private (your choice)
   - **DO NOT** initialize with README (we already have one)
   - **DO NOT** add .gitignore (we already have one)

3. **Click "Create repository"**

### Push Your Code

After creating the repository, GitHub will show you commands. Use these:

```powershell
# Add GitHub as remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/GrudgeWarlords.git

# Verify remote was added
git remote -v

# Push to GitHub
git push -u origin master
```

**Example** (replace with your username):
```powershell
git remote add origin https://github.com/nugye/GrudgeWarlords.git
git push -u origin master
```

### If You Need Authentication

GitHub requires authentication. You have two options:

**Option A: Personal Access Token (Recommended)**

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Give it a name: "GrudgeWarlords Deploy"
4. Select scopes: `repo` (all)
5. Click "Generate token"
6. **Copy the token** (you won't see it again!)
7. When pushing, use token as password:
   ```
   Username: YOUR_GITHUB_USERNAME
   Password: YOUR_TOKEN
   ```

**Option B: GitHub CLI**
```powershell
# Install GitHub CLI
winget install --id GitHub.cli

# Authenticate
gh auth login

# Push
git push -u origin master
```

## 🔷 Step 2: Deploy to Vercel

### Option A: Vercel Web Dashboard (Easiest)

1. **Go to Vercel**: https://vercel.com/new

2. **Import Git Repository**:
   - Click "Import Project"
   - Choose "Import Git Repository"
   - Connect your GitHub account if not already connected
   - Select `GrudgeWarlords` repository

3. **Configure Project**:
   - **Framework Preset**: Other
   - **Root Directory**: `./` (leave as is)
   - **Build Command**: Leave empty
   - **Output Directory**: Leave empty
   - **Install Command**: `npm install`

4. **Environment Variables** (if needed):
   - None required for now

5. **Click "Deploy"**

6. **Wait** (~2-3 minutes)

7. **Done!** Your game is live at: `https://grudge-warlords.vercel.app`

### Option B: Vercel CLI

```powershell
# Install Vercel CLI globally
npm install -g vercel

# Login to Vercel
vercel login

# Deploy (from project directory)
vercel

# Follow prompts:
# - Set up and deploy? Y
# - Which scope? (select your account)
# - Link to existing project? N
# - Project name? grudge-warlords
# - Directory? ./
# - Override settings? N

# Your project is now deployed!
```

### Production Deployment

After initial deployment, deploy to production:

```powershell
vercel --prod
```

## 🎯 Step 3: Verify Deployment

### Test Your Live Game

1. **Visit your Vercel URL**: `https://YOUR-PROJECT.vercel.app`

2. **Test Character Selection**:
   - Should load character select by default
   - Try selecting different characters
   - Test color customization
   - Click "Preview Attack"
   - Click "START GAME"

3. **Test Game Scenes**:
   - `https://YOUR-PROJECT.vercel.app/?scene=outdoor`
   - `https://YOUR-PROJECT.vercel.app/?scene=town`
   - `https://YOUR-PROJECT.vercel.app/?scene=inn`

4. **Check Console**: F12 → Console (should have no errors)

## 🔧 Step 4: Configure Custom Domain (Optional)

### In Vercel Dashboard

1. Go to your project settings
2. Click "Domains"
3. Add your custom domain
4. Follow DNS configuration instructions

## 🔄 Step 5: Set Up Continuous Deployment

**Good news!** This is automatic. Now whenever you push to GitHub:

```powershell
# Make changes to your code
# ... edit files ...

# Stage changes
git add .

# Commit
git commit -m "Add new feature"

# Push to GitHub
git push

# Vercel automatically deploys! 🎉
```

Vercel will:
- Detect the push
- Build your project
- Deploy to preview URL
- Deploy to production (if on main branch)

## 📊 Monitoring Deployments

### Vercel Dashboard

Visit: https://vercel.com/dashboard

You can see:
- Deployment status
- Build logs
- Analytics
- Error tracking
- Performance metrics

## 🐛 Troubleshooting

### Push to GitHub Failed

**Problem**: Authentication failed
```
Solution: Use Personal Access Token or GitHub CLI
```

**Problem**: Large file error
```
Solution: Files are ignored in .gitignore
If issue persists:
git rm --cached path/to/large/file
git commit -m "Remove large file"
```

### Vercel Build Failed

**Problem**: Dependencies not installing
```
Solution: Check package.json is in root
Ensure node version compatibility
```

**Problem**: Assets not loading
```
Solution: Check vercel.json configuration
Verify file paths are correct
```

**Problem**: 404 errors
```
Solution: Check rewrites in vercel.json
Ensure paths match your structure
```

### Characters Not Loading

**Problem**: GLB files too large
```
Solution: 
1. Check Vercel limits (4.5MB free tier)
2. Compress GLB files if needed
3. Use external CDN for large assets
```

## 📝 Update README with URLs

After deployment, update your README:

```markdown
## 🌐 Live Demo

Play now: **https://your-project.vercel.app**

GitHub: **https://github.com/YOUR_USERNAME/GrudgeWarlords**
```

## 🎯 Quick Reference Commands

```powershell
# Git Commands
git status                          # Check status
git add .                          # Stage changes
git commit -m "message"            # Commit
git push                           # Push to GitHub

# Vercel Commands
vercel                             # Deploy to preview
vercel --prod                      # Deploy to production
vercel logs                        # View logs
vercel env ls                      # List environment variables

# Pull latest from GitHub
git pull origin master

# Create new branch
git checkout -b feature/new-feature
git push -u origin feature/new-feature
```

## 🔐 Best Practices

### Git Workflow

1. **Always commit with descriptive messages**:
   ```
   git commit -m "feat: Add new character race"
   git commit -m "fix: Resolve animation bug"
   git commit -m "docs: Update README"
   ```

2. **Use co-author attribution**:
   ```
   git commit -m "feat: Add feature
   
   Co-Authored-By: Warp <agent@warp.dev>"
   ```

3. **Pull before pushing**:
   ```powershell
   git pull origin master
   git push
   ```

### Vercel Deployment

1. **Test locally first**: `npm start`
2. **Check console for errors**: F12 → Console
3. **Deploy to preview first**: `vercel`
4. **Test preview thoroughly**
5. **Deploy to production**: `vercel --prod`

## 🎉 Success Checklist

- [ ] Repository created on GitHub
- [ ] Code pushed to GitHub
- [ ] Vercel project created
- [ ] Initial deployment successful
- [ ] Character selection working
- [ ] All scenes accessible
- [ ] No console errors
- [ ] Mobile responsive (if applicable)
- [ ] README updated with live URLs
- [ ] Custom domain configured (optional)

## 🆘 Need Help?

### GitHub Issues
- Check: https://github.com/YOUR_USERNAME/GrudgeWarlords/issues
- Create issue if you find bugs

### Vercel Support
- Documentation: https://vercel.com/docs
- Community: https://github.com/vercel/vercel/discussions

### Project Documentation
- `CHARACTER-SYSTEM-GUIDE.md`
- `QUICKSTART-CHARACTER-SYSTEM.md`
- `README.md`

---

## 🎮 Your Game is Now Live!

**Congratulations!** 🎉

Your game is now:
- ✅ Version controlled with Git
- ✅ Hosted on GitHub
- ✅ Deployed on Vercel
- ✅ Accessible worldwide
- ✅ Auto-deploying on every push

Share your game URL with the world! 🌍⚔️🎯

---

**Last Updated**: January 2026
