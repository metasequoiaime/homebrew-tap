# Casks/msime-tibetan.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-tibetan" do
  version "0.52.0"
  sha256 "b44f5310b8d7f9cc44c6d46ebf825774939a398a5e84d5e0eec31f1e2cab7e1b"

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
    "~/Library/Preferences/app.msime.macos.tibetan.plist",
    "~/Library/Preferences/app.msime.inputmethod.tibetan.plist",
    "~/Library/Saved Application State/app.msime.macos.tibetan.savedState",
    "~/Library/WebKit/app.msime.macos.tibetan",
  ]

  caveats <<~EOS
    Open MSIME Tibetan once to finish installing: it adds 水杉藏文 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
