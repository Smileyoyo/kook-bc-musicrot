# KOOK Music Bot (Java Version)

A KOOK music bot framework built with JKook API and KookBC.

## Current Status

✅ Build successful - Plugin framework can be compiled and loaded into KookBC
⏳ Feature development - Music functions to be developed

## Quick Start (Windows)

### Requirements

- ✅ Java 11 or higher
- ✅ Network connection (for dependencies)

### 1. Clone Project

```powershell
git clone https://github.com/Smileyoyo/kook-bc-musicrot.git E:\kook-bc-musicrot
```

### 2. Initialize Gradle Wrapper

**For first-time use with Gradle:**

```powershell
init-wrapper.bat
```

This will download `gradle-wrapper.jar` (about 50KB).

### 3. Build and Install

#### Option 1: Gradle (Recommended)

```powershell
build-and-install.bat
```

This will automatically:
1. Build the project
2. Find KookBC directory
3. Copy the JAR file to `modules` folder

**If auto-detection fails**, it will ask you to enter the KookBC path.

Or step by step:
```powershell
build.bat
install-auto.bat
```

#### Option 2: Maven

```powershell
build-maven.bat
install-maven.bat
```

#### Option 3: Manual Install

If automatic installation doesn't work:

```powershell
# 1. Create modules directory
mkdir [KookBC目录]\modules

# 2. Copy JAR file
copy build\libs\kook-music-bot.jar [KookBC目录]\modules\

# 3. Run KookBC
cd [KookBC目录]
java -jar kookbc-0.33.0.jar
```

### 4. Run KookBC

```powershell
cd C:\KookBC
java -jar kookbc-0.33.0.jar
```

## Build Methods

### Gradle

| Script | Description |
|--------|-------------|
| `init-wrapper.bat` | Initialize Gradle Wrapper (first time only) |
| `check-env.bat` | Check Java environment |
| `build.bat` | Build project |
| `install.bat` | Install to KookBC |
| `build-and-install.bat` | One-click build and install |

### Maven

| Script | Description |
|--------|-------------|
| `build-maven.bat` | Build project |
| `install-maven.bat` | Install to KookBC |

## Common Issues

### Q: "gradle-wrapper.jar not found"
**A:** Run `init-wrapper.bat` to download it.

### Q: Download failed
**A:**
1. Check network connection
2. Try Maven instead: `build-maven.bat`
3. Or manually download from:
   https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar

### Q: "Java not found"
**A:**
1. Install Java 11+: https://adoptium.net/
2. Run `check-env.bat` to verify
3. Set JAVA_HOME environment variable

### Q: Build failed
**A:**
1. Check Java version (11+)
2. Check network connection
3. Try Maven instead: `build-maven.bat`

### Q: KookBC didn't load plugin
**A:**
1. Check JAR is in `modules` directory
2. Check KookBC version (0.33.0+)
3. Check console logs for errors

## Tech Stack

- **Java**: 11+
- **JKook API**: 0.54.2 (provided by KookBC)
- **KookBC**: 0.33.0
- **OkHttp**: HTTP client
- **Gson**: JSON parsing
- **Gradle**: 8.5 (recommended)
- **Maven**: 3.8+ (alternative)

## Features Plan

- [ ] Basic framework
- [ ] Music parsing (NetEase, QQ, Bilibili)
- [ ] Queue management
- [ ] Command handling
- [ ] Playback control
- [ ] Card interaction

## Resources

- JKook API: https://github.com/SNWCreations/JKook
- KookBC: https://github.com/SNWCreations/KookBC
- KOOK Developer: https://developer.kookapp.cn

## Change Log

### 2026-04-02
- ✅ Create clean project structure
- ✅ Configure Gradle build
- ✅ Add Gradle Wrapper support
- ✅ Add Maven alternative
- ✅ Add Chinese mirrors for dependencies
- ✅ Add environment check script
- ✅ Add Windows batch scripts
- ✅ Add initialization script for Gradle Wrapper
- ⏳ Continue feature development

## License

MIT License
