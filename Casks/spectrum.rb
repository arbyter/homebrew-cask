cask "spectrum" do
  version "1.0.5"
  sha256 "f6434f821b9c9a9384e58db5ae1dbad45922d2b63b47ea3f93651bc6dd4a9f18"

  url "https://github.com/withspectrum/spectrum/releases/download/v#{version}/Spectrum-#{version}-mac.zip",
      verified: "github.com/withspectrum/spectrum/"
  appcast "https://spectrum.chat/apps"
  name "Spectrum"
  desc "Simple, powerful online communities"
  homepage "https://spectrum.chat/"

  app "Spectrum.app"
end
