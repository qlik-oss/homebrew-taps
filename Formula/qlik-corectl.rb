class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.1.1.tar.gz"
  sha256 "032923ed8152b409f9c58a838243137a4c529f8ba41e19de3cb9d03207b2dbda"

  depends_on "go" => [:build, "1.11"]

  def install
    system "go build -ldflags \"-X main.version=#{version}\""
    bin.install "corectl"
  end

  test do
    assert_equal "corectl version: #{version}", shell_output("#{bin}/corectl version").chomp
  end
end
