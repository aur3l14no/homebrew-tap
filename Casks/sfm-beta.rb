cask "sfm-beta" do
  version "1.14.0-alpha.14"
  sha256 "754e35b2f467f002a92831acfde84a4a8999d4fe7ab7c6e2769b43d4a506a29d"

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
