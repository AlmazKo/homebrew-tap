# Homebrew cask for EpiScope (direct distribution, no App Store).
#
# This file is the source of truth; copy it into the tap repo on publish
# (github.com/AlmazKo/homebrew-tap -> Casks/episcope.rb). release.sh patches
# `version` and `sha256` from the freshly notarized DMG on every release;
# the `url` interpolates #{version}, so only those two lines change.
cask "episcope" do
  version "0.7"
  sha256 "8e71af2ef2da81e3e341eb7c8d26440e0e444ff4c0968570ebcef5bdfb0cb9d9"

  url "https://github.com/AlmazKo/EpiScope/releases/download/v#{version}/EpiScope-#{version}.dmg",
      verified: "github.com/AlmazKo/EpiScope/"
  name "EpiScope"
  desc "Menu-bar monitor for Claude Code, Codex and Claude Desktop agent sessions"
  homepage "https://github.com/AlmazKo/EpiScope"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "EpiScope.app"

  # Only app-owned state. ~/.claude (the tracker hook + cc-states) is shared
  # with the user's Claude install and is deliberately left untouched.
  zap trash: [
    "~/Library/Caches/almazko.EpiScope",
    "~/Library/Preferences/almazko.EpiScope.plist",
    "~/Library/Saved Application State/almazko.EpiScope.savedState",
  ]
end
