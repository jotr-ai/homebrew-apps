cask "jotr" do
  version "1.0.9,12"
  sha256 "a5487b0af8103dab53c411128bdbeb76a118947a0c452e10c13b29eb80c0be67"

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
