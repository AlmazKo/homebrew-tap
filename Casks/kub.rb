# Homebrew cask for Kub (direct distribution, no App Store).
#
# This file is the source of truth; copy it into the tap repo on publish
# (github.com/AlmazKo/homebrew-tap -> Casks/kub.rb). release.sh patches
# `version` and `sha256` from the freshly notarized DMG on every release;
# the `url` interpolates #{version}, so only those two lines change.
cask "kub" do
  version "0.1"
  sha256 "4fc4e791434871bd9b673be566179be8f880961aaabe8beb2c7b7108d5c0b2bb"

  url "https://github.com/AlmazKo/Kub/releases/download/v#{version}/Kub-#{version}.dmg"
  name "Kub"
  desc "Minimal native Kubernetes viewer for developers"
  homepage "https://github.com/AlmazKo/Kub"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Kub.app"

  # Only app-owned state; nothing under ~/.kube (the user's kubeconfig) is touched.
  zap trash: [
    "~/Library/Caches/almazko.Kub",
    "~/Library/Preferences/almazko.Kub.plist",
    "~/Library/Saved Application State/almazko.Kub.savedState",
  ]
end
