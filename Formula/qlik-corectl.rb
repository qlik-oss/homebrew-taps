class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.2.0.tar.gz"
  sha256 "8fe794bcc59c511e8f07d7cb728bb3bce8283fe4fac23f6347a65c28a9a88856"

  depends_on "go" => [:build]

  def install
    system "go build -ldflags \"-X main.version=#{version}\""
    bin.install "corectl"
  end

  test do
    assert_equal "corectl version: #{version}", shell_output("#{bin}/corectl version").chomp
  end
end
