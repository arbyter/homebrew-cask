cask "cutter" do
  version "2.0.0"
  sha256 "d3b1359e6d0d19b423d760eb92e28242a60a07f9a46467d8ead58e905b89e466"

  url "https://github.com/radareorg/cutter/releases/download/v#{version}/Cutter-v#{version}-x64.macOS.dmg",
      verified: "github.com/radareorg/cutter/"
  name "Cutter"
  desc "Reverse engineering platform powered by radare2"
  homepage "https://cutter.re/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sierra"

  app "Cutter.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/cutter.wrapper.sh"
  binary shimscript, target: "cutter"

  preflight do
    IO.write shimscript, <<~EOS
      #!/bin/sh
      '#{appdir}/Cutter.app/Contents/MacOS/Cutter' "$@"
    EOS
  end

  zap trash: [
    "~/.config/RadareOrg",
    "~/.local/share/radare2",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.radare.cutter.sfl*",
    "~/Library/Application Support/RadareOrg",
    "~/Library/Preferences/org.radare.cutter.plist",
    "~/Library/Saved Application State/org.radare.cutter.savedState",
  ]
end
