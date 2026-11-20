cask "inquiline" do
  version "0.6.0"
  sha256 "701ad021f24eae6287c4ad88808850f7da8cb6f36dd1b5727452b71a9e096ce3"

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
