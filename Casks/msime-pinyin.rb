# Casks/msime-pinyin.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-pinyin" do
  version "0.52.0"
  sha256 "4338aa10f5d201acf47dde02451ff2e2df041dc3cdcff6ff955bcc42ed924f80"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-pinyin-#{version}-universal.dmg"
  name "MSIME Pinyin"
  name "水杉拼音"
  desc "Chinese input method for pinyin and shuangpin"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MSIME Pinyin.app"

  # The settings app copies the input method here on its first launch.
  uninstall quit:   ["app.msime.macos.pinyin", "app.msime.inputmethod.pinyin"],
            delete: "~/Library/Input Methods/水杉拼音.app"

  zap trash: [
    "~/Library/Application Support/app.msime.macos.pinyin",
    "~/Library/Caches/app.msime.macos.pinyin",
    "~/Library/Preferences/app.msime.macos.pinyin.plist",
    "~/Library/Preferences/app.msime.inputmethod.pinyin.plist",
    "~/Library/Saved Application State/app.msime.macos.pinyin.savedState",
    "~/Library/WebKit/app.msime.macos.pinyin",
  ]

  caveats <<~EOS
    Open MSIME Pinyin once to finish installing: it adds 水杉拼音 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
