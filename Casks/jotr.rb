cask "jotr" do
  version "1.0.9,11"
  sha256 "cb8acf745157949227b607ac1a6f783a2e06f8e48d03216d279295a28f3e4605"

  url "https://downloads.jotr.ai/releases/Jotr-#{version.csv.first}-build#{version.csv.second}.dmg"
  name "Jotr"
  desc "Local audio and video transcription, review, summaries, and export"
  homepage "https://jotr.ai/"

  livecheck do
    skip "Jotr releases are updated through this tap release process"
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Jotr.app"

  zap trash: [
    "~/Library/Caches/com.jotr.app",
    "~/Library/Preferences/ai.jotr.app.plist",
    "~/Library/Preferences/com.jotr.app.plist",
  ]
end
