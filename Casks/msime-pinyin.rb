# Casks/msime-pinyin.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-pinyin" do
  version "0.58.0"
  sha256 "5f7dfdf8511376606ff658ba353b486139f7d6c79f0885d8d2f6acde4da30f84"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-pinyin-#{version}-universal.pkg"
  name "MSIME Pinyin"
  name "水杉拼音"
  desc "Chinese input method for pinyin and shuangpin"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 设置应用由 Sparkle 就地更新，brew 不必每个版本都重装它（重装时 uninstall 会先删掉输入法）。
  auto_updates true
  depends_on macos: :ventura

  # 安装包把 MSIME Pinyin.app 装进 /Applications，要管理员密码：brew 以 sudo 运行 installer。
  pkg "msime-macos-pinyin-#{version}-universal.pkg"

  # 设置应用第一次启动时把输入法装进 ~/Library/Input Methods。应用除了按回执卸载还要显式删除：Sparkle 更新过之后，磁盘上的 bundle 和回执对不上。
  uninstall quit:    ["app.msime.macos.pinyin", "app.msime.inputmethod.pinyin"],
            pkgutil: "app.msime.macos.pinyin.pkg",
            delete:  [
              "/Applications/MSIME Pinyin.app",
              "~/Library/Input Methods/水杉拼音.app",
            ]

  zap trash: [
    "~/Library/Application Support/app.msime.macos.pinyin",
    "~/Library/Caches/app.msime.macos.pinyin",
    "~/Library/Preferences/app.msime.inputmethod.pinyin.plist",
    "~/Library/Preferences/app.msime.macos.pinyin.plist",
    "~/Library/Saved Application State/app.msime.macos.pinyin.savedState",
    "~/Library/WebKit/app.msime.macos.pinyin",
  ]

  caveats <<~EOS
    Installing and upgrading need an administrator password.
    Open MSIME Pinyin once to finish installing: it adds 水杉拼音 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
