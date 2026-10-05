# Casks/msime-wubi.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-wubi" do
  version "0.52.0"
  sha256 "8d09a3012396dee3745edccc49c5ca934035d2c35ae4fa3d78b174277ba118bd"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-wubi-#{version}-universal.dmg"
  name "MSIME Wubi"
  name "水杉五笔"
  desc "Chinese input method for wubi"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MSIME Wubi.app"

  # The settings app copies the input method here on its first launch.
  uninstall quit:   ["app.msime.macos.wubi", "app.msime.inputmethod.wubi"],
            delete: "~/Library/Input Methods/水杉五笔.app"

  zap trash: [
    "~/Library/Application Support/app.msime.macos.wubi",
    "~/Library/Caches/app.msime.macos.wubi",
    "~/Library/Preferences/app.msime.macos.wubi.plist",
    "~/Library/Preferences/app.msime.inputmethod.wubi.plist",
    "~/Library/Saved Application State/app.msime.macos.wubi.savedState",
    "~/Library/WebKit/app.msime.macos.wubi",
  ]

  caveats <<~EOS
    Open MSIME Wubi once to finish installing: it adds 水杉五笔 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
