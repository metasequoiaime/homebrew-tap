# metasequoiaime/homebrew-tap

Homebrew tap for 水杉输入法 (MSIME), a Chinese input method.

```sh
brew install --cask metasequoiaime/tap/msime
```

After installing, open MSIME once: it adds 水杉输入法 to your input sources. On a Mac where it was never installed, log out and back in before it appears. Apple silicon and macOS 13 or later only.

The cask also puts `msime-mcp` on your PATH, the MCP server an AI assistant can run to look into input method problems and manage quick phrases and preferences.

`Casks/msime.rb` is written by the [macOS release workflow](https://github.com/metasequoiaime/msime/blob/develop/.github/workflows/release-macos.yml) from [its template](https://github.com/metasequoiaime/msime/blob/develop/platforms/macos/homebrew/msime.rb.in) after every notarized release. Changes to the cask belong in that template; edits made here are overwritten.
