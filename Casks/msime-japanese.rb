# Casks/msime-japanese.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-japanese" do
  version "0.56.1"
  sha256 "8d84d6869f9ead2419897d5862a0aa48b70e16e6c8e62f060a1baad46196b0f6"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-japanese-#{version}-universal.dmg"
  name "MSIME Japanese"
  name "水杉日语"
  desc "Japanese input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MSIME Japanese.app"

  # The settings app copies the input method here on its first launch.
  uninstall quit:   ["app.msime.macos.japanese", "app.msime.inputmethod.japanese"],
            delete: "~/Library/Input Methods/水杉日语.app"

  zap trash: [
    "~/Library/Application Support/app.msime.macos.japanese",
    "~/Library/Caches/app.msime.macos.japanese",
    "~/Library/Preferences/app.msime.inputmethod.japanese.plist",
    "~/Library/Preferences/app.msime.macos.japanese.plist",
    "~/Library/Saved Application State/app.msime.macos.japanese.savedState",
    "~/Library/WebKit/app.msime.macos.japanese",
  ]

  caveats <<~EOS
    Open MSIME Japanese once to finish installing: it adds 水杉日语 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
