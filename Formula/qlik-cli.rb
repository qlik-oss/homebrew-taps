# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  homepage ""
  version "2.3.1"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.3.1/qlik-Darwin-x86_64.tar.gz"
      sha256 "0f488e47f785d71ea2c1a9fa1e4091738174dc51b8b965e06976f32d97c20691"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.3.1/qlik-Linux-x86_64.tar.gz"
      sha256 "41b69ceed22a7a707d0ccbc018d27d9b17f16d2aa52923a880dbaa356d7bb82e"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
