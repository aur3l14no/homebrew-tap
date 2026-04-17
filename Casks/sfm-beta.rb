cask "sfm-beta" do
  version "1.14.0-alpha.13"
  sha256 "739ff8728e1c0212717aa506c4f467c757886a8b412ec3b559785f7d531897d1"

  url "https://github.com/SagerNet/sing-box/releases/download/v#{version}/SFM-#{version}-Universal.pkg",
      verified: "github.com/SagerNet/sing-box/"
  name "SFM"
  desc "Standalone client for sing-box, the universal proxy platform"
  homepage "https://sing-box.sagernet.org/"

  livecheck do
    url "https://github.com/SagerNet/sing-box/releases"
    regex(/v?(\d+(?:\.\d+)+(?:-(?:alpha|beta|rc)\.\d+))/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next unless release["prerelease"]

        match = release["tag_name"]&.match(regex)
        match[1] if match
      end
    end
  end

  depends_on macos: ">= :ventura"

  pkg "SFM-#{version}-Universal.pkg"

  uninstall quit: "io.nekohasekai.sfavt.standalone",
            login_item: "SFM",
            pkgutil: "io.nekohasekai.sfavt.standalone"

  zap trash: [
    "~/Library/Application Scripts/287TTNZF8L.io.nekohasekai.sfavt",
    "~/Library/Group Containers/287TTNZF8L.io.nekohasekai.sfavt",
    "~/Library/Preferences/io.nekohasekai.sfavt.standalone.plist",
  ]
end
