cask "inquiline" do
  version "0.8.0"
  sha256 "69c37548dae55890bb80271a717a47f3e98143169ba4ab7f5232f85ea1673d6f"

  url "https://github.com/inquiline-app/inquiline/releases/download/v#{version}/Inquiline-#{version}-arm64.dmg"
  name "Inquiline"
  desc "Runs Android apps, each in its own window"
  homepage "https://github.com/inquiline-app/inquiline"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Inquiline.app"

  zap trash: [
    "~/Library/Application Support/Inquiline",
    "~/Library/Caches/io.github.inquiline-app.Inquiline",
    "~/Library/HTTPStorages/io.github.inquiline-app.Inquiline",
    "~/Library/HTTPStorages/io.github.inquiline-app.Inquiline.binarycookies",
    "~/Library/Logs/Inquiline",
    "~/Library/Preferences/io.github.inquiline-app.*.plist",
  ]

  caveats <<~EOS
    Inquiline isn't notarized by Apple yet, so macOS stops it the first time.
    After the warning, open System Settings > Privacy & Security and choose
    Open Anyway next to Inquiline. You only do this once.

    Android apps you add appear in /Applications as their own apps. To remove
    one, move it to the Trash. To remove them all with their data, move
    Inquiline itself to the Trash while it's running.
  EOS
end
