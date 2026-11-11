# Casks/msime-japanese.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-japanese" do
  version "0.59.4"
  sha256 "977a5196bf3c37c9e6b87c8784b16737fccff0be101aa07284cd976ed2cf61ac"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-japanese-#{version}-universal.pkg"
  name "MSIME Japanese"
  name "水杉日语"
  desc "Japanese input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 设置应用由 Sparkle 就地更新，brew 不必每个版本都重装它（重装时 uninstall 会先删掉输入法）。
  auto_updates true
  depends_on macos: :ventura

  # 安装包把 MSIME Japanese.app 装进 /Applications，要管理员密码：brew 以 sudo 运行 installer。
  pkg "msime-macos-japanese-#{version}-universal.pkg"

  # 设置应用第一次启动时把输入法装进 ~/Library/Input Methods。应用除了按回执卸载还要显式删除：Sparkle 更新过之后，磁盘上的 bundle 和回执对不上。
  uninstall quit:    ["app.msime.macos.japanese", "app.msime.inputmethod.japanese"],
            pkgutil: "app.msime.macos.japanese.pkg",
            delete:  [
              "/Applications/MSIME Japanese.app",
              "~/Library/Input Methods/水杉日语.app",
            ]

  zap trash: [
    "~/Library/Application Support/app.msime.macos.japanese",
    "~/Library/Caches/app.msime.macos.japanese",
    "~/Library/Preferences/app.msime.inputmethod.japanese.plist",
    "~/Library/Preferences/app.msime.macos.japanese.plist",
    "~/Library/Saved Application State/app.msime.macos.japanese.savedState",
    "~/Library/WebKit/app.msime.macos.japanese",
  ]

  caveats <<~EOS
    Installing and upgrading need an administrator password.
    Open MSIME Japanese once to finish installing: it adds 水杉日语 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
