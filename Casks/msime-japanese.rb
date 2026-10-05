# Casks/msime-japanese.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-japanese" do
  version "0.52.0"
  sha256 "f173d94c26657cea94fb95c14972e486e50a6714eda2e15264b8434908efd85e"

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
    "~/Library/Preferences/app.msime.macos.japanese.plist",
    "~/Library/Preferences/app.msime.inputmethod.japanese.plist",
    "~/Library/Saved Application State/app.msime.macos.japanese.savedState",
    "~/Library/WebKit/app.msime.macos.japanese",
  ]

  caveats <<~EOS
    Open MSIME Japanese once to finish installing: it adds 水杉日语 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
