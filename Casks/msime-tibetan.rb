# Casks/msime-tibetan.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-tibetan" do
  version "0.56.1"
  sha256 "db213b4f6bd122e5e574f4bbe49512b2856eae28a1bcd09e10d3d80c99f034fc"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-tibetan-#{version}-universal.dmg"
  name "MSIME Tibetan"
  name "水杉藏文"
  desc "Tibetan input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MSIME Tibetan.app"

  # The settings app copies the input method here on its first launch.
  uninstall quit:   ["app.msime.macos.tibetan", "app.msime.inputmethod.tibetan"],
            delete: "~/Library/Input Methods/水杉藏文.app"

  zap trash: [
    "~/Library/Application Support/app.msime.macos.tibetan",
    "~/Library/Caches/app.msime.macos.tibetan",
    "~/Library/Preferences/app.msime.inputmethod.tibetan.plist",
    "~/Library/Preferences/app.msime.macos.tibetan.plist",
    "~/Library/Saved Application State/app.msime.macos.tibetan.savedState",
    "~/Library/WebKit/app.msime.macos.tibetan",
  ]

  caveats <<~EOS
    Open MSIME Tibetan once to finish installing: it adds 水杉藏文 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
