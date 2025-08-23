cask "atlassify" do
  homepage "https://atlassify.io"
  
  version "2.2.0"
  sha256 :no_check

  on_intel do
    url "https://github.com/setchy/atlassify/releases/download/v#{version}/Atlassify-#{version}-mac.zip"
  end
  on_arm do
    url "https://github.com/setchy/atlassify/releases/download/v#{version}/Atlassify-#{version}-arm64-mac.zip"
  end

  name "Atlassify"
  desc "Atlassian notifications on your menu bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Atlassify.app"

  preflight do
    retries ||= 3
    ohai "Attempting to close Atlassify.app to avoid unwanted user intervention" if retries >= 3
    while retries > 0
      if system "/usr/bin/pkill", "-f", "/Applications/Atlassify.app"
        break
      else
        retries -= 1
        sleep 1
      end
    end
    opoo "Unable to forcibly close Atlassify.app"
  end

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
    "~/Library/Preferences/com.electron.atlassify*.plist",
    "~/Library/Saved Application State/com.electron.atlassify.savedState",
  ]
end
