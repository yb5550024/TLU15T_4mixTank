# TLU15A（Clipper 5.2 / DOS）

本 Repo 以 **純 Clipper 5.2** 為主（工具鏈：`CLIPPER.EXE` + `RTLINK.EXE`），並以 **DOSBox-X** 進行編譯與執行。

## 目錄結構

- `src/`：Clipper 原始碼（*.prg）
- `build/`：安全編譯腳本、RTLINK 連結清單（link.lnk）
- `data/`：DBF/CDX/NTX 等資料（視為 binary，**不要讓 Git/Codex 改動內容**）
- `release/`：輸出 exe（Repo 內僅保留 `.keep`，避免把 exe 直接進版控）
- `logs/`：每次 build 會輸出 log（Repo 內僅保留 `.keep`）
- `tools/`：DOSBox-X 啟動與 DOSBox 內 build 輔助

## 建議工作流程（Windows 11）

### A. 啟動 DOSBox-X
使用你現有的捷徑/批次檔：
- `D:\BJDOS\_DosBoxX\啟動DOSBox-X.bat`

Repo 內也提供：
- `tools\run_dosboxx.bat`（只是轉呼叫，不改你原本的設定）

### B. 在 DOSBox-X 內 mount 專案資料夾
在 DOSBox-X 命令列輸入（範例）：

```
mount c D:\TLU15A
c:
```

> 請把 `D:\TLU15A` 換成你實際的 repo 路徑。

### C. 在 DOSBox-X 內編譯
在 DOSBox-X 輸入：

```
cd \build
build_safe.bat
```

或使用輔助腳本：

```
tools\dosbox_build.bat
```

## 產出

成功後會在：

- `release\TLU15A.EXE`

並自動備份舊版至：

- `release\backup\TLU15A.EXE.<BUILD_ID>`

## 加入新模組（多個 PRG）
1. 把新檔案放進 `src/`（例：`MAIN.PRG`）
2. 編譯行為由 `build\build_safe.bat` 觸發（你可在裡面加編譯）
3. 重要：同步更新 `build\link.lnk`，每個模組一行，例如：

```
FI TLU15A
FI MAIN
```

## Git 安全
- `.gitattributes` 已將 `*.dbf/*.cdx/*.ntx` 設定為 `binary`，避免換行/合併破壞資料檔
- `release/` 與 `logs/` 內容預設忽略，避免把 exe / log 加入版控
