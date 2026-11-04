cask "atlassify" do
  arch arm: "-arm64"
  os macos: "-mac.zip", linux: ".AppImage"

  version "3.17.3"
  sha256 :no_check

  on_macos do
    depends_on macos: :ventura

    app "Atlassify.app"

    uninstall quit: [
      "com.electron.atlassify",
      "com.electron.atlassify.helper",
    ]

    zap trash: [
      "~/Library/Application Support/atlassify",
      "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.electron.atlassify.sfl*",
      "~/Library/Caches/atlassify-updater",
      "~/Library/Caches/com.electron.atlassify*",
      "~/Library/HTTPStorages/com.electron.atlassify",
      "~/Library/Logs/atlassify",
      "~/Library/Preferences/com.electron.atlassify*.plist",
      "~/Library/Saved Application State/com.electron.atlassify.savedState",
    ]
  end
  on_linux do
    depends_on arch: :x86_64

    app_image "Atlassify-#{version}.AppImage", target: "Atlassify.AppImage"

    zap trash: "~/.config/atlassify"
  end

  url "https://github.com/setchy/atlassify/releases/download/v#{version}/Atlassify-#{version}#{arch}#{os}"
  name "Atlassify"
  desc "Atlassian notifications on your menu bar"
  homepage "https://atlassify.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
end
