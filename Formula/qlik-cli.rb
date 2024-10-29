# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Cloud."
  version "2.26.0"

  on_macos do
    url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/master/bin/qlik-cli/v2.26.0/qlik-Darwin-x86_64.tar.gz"
    sha256 "907b4333b459ee49d46c4fdadb866404452a641974c7e14d36304f96b8241d2a"

    def install
      bin.install "qlik"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the QlikCli
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/master/bin/qlik-cli/v2.26.0/qlik-Linux-x86_64.tar.gz"
      sha256 "3c5d9082d8c19ac09a64f6f6c9dc7d396e663615038ebadc2b7742d4027b7123"

      def install
        bin.install "qlik"
      end
    end
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
