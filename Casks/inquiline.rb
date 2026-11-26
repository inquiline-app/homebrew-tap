cask "inquiline" do
  version "0.9.1"
  sha256 "48cae2ce0ad21bcd1b39a07d2983c7b837b6e8275c11bf62f3ce6640af6bb482"

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
