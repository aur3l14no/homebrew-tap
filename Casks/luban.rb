cask "luban" do
  version :latest
  sha256 :no_check

  url "https://releases.luban.dev/Luban_latest_darwin-universal.dmg"
  name "Luban"
  desc "Localhost-only AI code editor"
  homepage "https://github.com/Xuanwo/luban"

  app "Luban.app"
end
