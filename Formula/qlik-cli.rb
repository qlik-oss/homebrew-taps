# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a CLI for using Qlik Sense Cloud editions."
  version "0.3.1"
  bottle :unneeded

  if OS.mac?
    url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/publish-experiments/bin/qlik-cli/v0.3.1/qlik-Darwin-x86_64.tar.gz"
    sha256 "cd434c29c726ce08125c476b5696923afcdcb4f829e9bffd1b5313cac210981a"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/publish-experiments/bin/qlik-cli/v0.3.1/qlik-Linux-x86_64.tar.gz"
      sha256 "4dc0a88833317b8c71a80ff3cacfbcb995e68f5e0662a31f1417545bd1a41c9a"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end

