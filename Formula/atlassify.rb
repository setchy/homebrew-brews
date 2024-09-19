cask "atlassify" do
  version "0.2.0"
  sha256 "9c3970bd8deff3f814188309a63cf6318205b368f89daece0be4440bc32f03a5"

  url "https://github.com/setchy/atlassify/releases/download/v#{version}/Atlassify-#{version}-universal-mac.zip"
  name "Atlassify"
  desc "Atlassian notifications on your menu bar"
  homepage "https://github.com/setchy/atlassify"

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
    return unless system_command "/usr/bin/pkill", args: ["-f", "/Applications/Atlassify.app"]
  rescue RuntimeError
    sleep 1
    retry unless (retries -= 1).zero?
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
