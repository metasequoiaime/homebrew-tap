# Casks/msime-tibetan.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-tibetan" do
  version "0.59.1"
  sha256 "2d149d08c98ac02fb56990020916cf14ee42b3b01995c935841c10daa44962f3"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-tibetan-#{version}-universal.pkg"
  name "MSIME Tibetan"
  name "水杉藏文"
  desc "Tibetan input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 设置应用由 Sparkle 就地更新，brew 不必每个版本都重装它（重装时 uninstall 会先删掉输入法）。
  auto_updates true
  depends_on macos: :ventura

  # 安装包把 MSIME Tibetan.app 装进 /Applications，要管理员密码：brew 以 sudo 运行 installer。
  pkg "msime-macos-tibetan-#{version}-universal.pkg"

  # 设置应用第一次启动时把输入法装进 ~/Library/Input Methods。应用除了按回执卸载还要显式删除：Sparkle 更新过之后，磁盘上的 bundle 和回执对不上。
  uninstall quit:    ["app.msime.macos.tibetan", "app.msime.inputmethod.tibetan"],
            pkgutil: "app.msime.macos.tibetan.pkg",
            delete:  [
              "/Applications/MSIME Tibetan.app",
              "~/Library/Input Methods/水杉藏文.app",
            ]

  zap trash: [
    "~/Library/Application Support/app.msime.macos.tibetan",
    "~/Library/Caches/app.msime.macos.tibetan",
    "~/Library/Preferences/app.msime.inputmethod.tibetan.plist",
    "~/Library/Preferences/app.msime.macos.tibetan.plist",
    "~/Library/Saved Application State/app.msime.macos.tibetan.savedState",
    "~/Library/WebKit/app.msime.macos.tibetan",
  ]

  caveats <<~EOS
    Installing and upgrading need an administrator password.
    Open MSIME Tibetan once to finish installing: it adds 水杉藏文 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
