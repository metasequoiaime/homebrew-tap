# Casks/msime-vietnamese.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-vietnamese" do
  version "0.59.1"
  sha256 "7e80dab1cef7bf795f5ea792bba588ee2d278c208e85f4d7df9ef6781c534c9f"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-vietnamese-#{version}-universal.pkg"
  name "MSIME Vietnamese"
  name "水杉越南语"
  desc "Vietnamese input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 设置应用由 Sparkle 就地更新，brew 不必每个版本都重装它（重装时 uninstall 会先删掉输入法）。
  auto_updates true
  depends_on macos: :ventura

  # 安装包把 MSIME Vietnamese.app 装进 /Applications，要管理员密码：brew 以 sudo 运行 installer。
  pkg "msime-macos-vietnamese-#{version}-universal.pkg"

  # 设置应用第一次启动时把输入法装进 ~/Library/Input Methods。应用除了按回执卸载还要显式删除：Sparkle 更新过之后，磁盘上的 bundle 和回执对不上。
  uninstall quit:    ["app.msime.macos.vietnamese", "app.msime.inputmethod.vietnamese"],
            pkgutil: "app.msime.macos.vietnamese.pkg",
            delete:  [
              "/Applications/MSIME Vietnamese.app",
              "~/Library/Input Methods/水杉越南语.app",
            ]

  zap trash: [
    "~/Library/Application Support/app.msime.macos.vietnamese",
    "~/Library/Caches/app.msime.macos.vietnamese",
    "~/Library/Preferences/app.msime.inputmethod.vietnamese.plist",
    "~/Library/Preferences/app.msime.macos.vietnamese.plist",
    "~/Library/Saved Application State/app.msime.macos.vietnamese.savedState",
    "~/Library/WebKit/app.msime.macos.vietnamese",
  ]

  caveats <<~EOS
    Installing and upgrading need an administrator password.
    Open MSIME Vietnamese once to finish installing: it adds 水杉越南语 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
