# Casks/msime-vietnamese.rb in metasequoiaime/homebrew-tap, written by release-macos.yml; edit this template, not the tap.
cask "msime-vietnamese" do
  version "0.55.0"
  sha256 "8623a0e589b6494e3a180c08a73ca2e5adf53afd6cd5a9c3fa31a3711d8af98e"

  url "https://github.com/metasequoiaime/msime/releases/download/macos-v#{version}/msime-macos-vietnamese-#{version}-universal.dmg"
  name "MSIME Vietnamese"
  name "水杉越南语"
  desc "Vietnamese input method"
  homepage "https://github.com/metasequoiaime/msime"

  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "MSIME Vietnamese.app"

  # The settings app copies the input method here on its first launch.
  uninstall quit:   ["app.msime.macos.vietnamese", "app.msime.inputmethod.vietnamese"],
            delete: "~/Library/Input Methods/水杉越南语.app"

  zap trash: [
    "~/Library/Application Support/app.msime.macos.vietnamese",
    "~/Library/Caches/app.msime.macos.vietnamese",
    "~/Library/Preferences/app.msime.macos.vietnamese.plist",
    "~/Library/Preferences/app.msime.inputmethod.vietnamese.plist",
    "~/Library/Saved Application State/app.msime.macos.vietnamese.savedState",
    "~/Library/WebKit/app.msime.macos.vietnamese",
  ]

  caveats <<~EOS
    Open MSIME Vietnamese once to finish installing: it adds 水杉越南语 to your input sources.
    On a Mac where it was never installed, log out and back in after that before it appears.
  EOS
end
