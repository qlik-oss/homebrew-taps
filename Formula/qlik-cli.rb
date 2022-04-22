# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Cloud."
  homepage ""
  version "2.10.1"

  on_macos do
    url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.10.1/qlik-Darwin-x86_64.tar.gz"
    sha256 "af9eaca9d1aaf139fdd95eec05e04b0b8c85aeee05e816a13ae52efab6994a25"

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
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.10.1/qlik-Linux-x86_64.tar.gz"
      sha256 "fe9473b6624b181bd382a3a04138b9f366b4ae889600bdb8170e1870882e3249"

      def install
        bin.install "qlik"
      end
    end
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
