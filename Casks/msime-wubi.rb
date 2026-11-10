# Casks/msime-wubi.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-wubi" do
  version "0.59.3"
  sha256 "bd10585fece4b70f378698e62916e6597082258a584f619b5ab1b95f71a7e41a"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-wubi-#{version}-universal.pkg"
  name "MSIME Wubi"
  name "水杉五笔"
  desc "Chinese input method for wubi"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 设置应用由 Sparkle 就地更新，brew 不必每个版本都重装它（重装时 uninstall 会先删掉输入法）。
  auto_updates true
  depends_on macos: :ventura

  # 安装包把 MSIME Wubi.app 装进 /Applications，要管理员密码：brew 以 sudo 运行 installer。
  pkg "msime-macos-wubi-#{version}-universal.pkg"

  # 设置应用第一次启动时把输入法装进 ~/Library/Input Methods。应用除了按回执卸载还要显式删除：Sparkle 更新过之后，磁盘上的 bundle 和回执对不上。
  uninstall quit:    ["app.msime.macos.wubi", "app.msime.inputmethod.wubi"],
            pkgutil: "app.msime.macos.wubi.pkg",
            delete:  [
              "/Applications/MSIME Wubi.app",
              "~/Library/Input Methods/水杉五笔.app",
            ]

  zap trash: [
    "~/Library/Application Support/app.msime.macos.wubi",
    "~/Library/Caches/app.msime.macos.wubi",
    "~/Library/Preferences/app.msime.inputmethod.wubi.plist",
    "~/Library/Preferences/app.msime.macos.wubi.plist",
    "~/Library/Saved Application State/app.msime.macos.wubi.savedState",
    "~/Library/WebKit/app.msime.macos.wubi",
  ]

  caveats <<~EOS
    Installing and upgrading need an administrator password.
    Open MSIME Wubi once to finish installing: it adds 水杉五笔 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
