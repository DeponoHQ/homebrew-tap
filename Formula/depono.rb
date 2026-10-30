# Copyright 2026 The Depono Authors
# SPDX-License-Identifier: Apache-2.0
#
# Homebrew formula TEMPLATE for the `depono` CLI. The release build
# (build_depono_cli_release.sh) renders it with the version and each
# tarball's SHA-256 into dist/depono-cli/<version>/depono.rb; that rendered
# file is what goes into the tap repository (DeponoHQ/homebrew-tap,
# Formula/depono.rb), so users run:
#
#   brew install DeponoHQ/tap/depono
#
# Placeholders: 0.1.0 and @SHA256_<OS>_<ARCH>@ (filled per release).
class Depono < Formula
  desc "Depono command-line tool: private git hosting, project items and AI models"
  homepage "https://depono.xyz"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/DeponoHQ/depono/releases/download/cli-v0.1.0/depono-macos-arm64.tar.gz"
      sha256 "7967600c5143d9c6bfe9717154a1e21efff2ffb49ff1debbfc7e0acd444fd917"
    end
    on_intel do
      url "https://github.com/DeponoHQ/depono/releases/download/cli-v0.1.0/depono-macos-x86_64.tar.gz"
      sha256 "7ead989efd54004b5eabcf452f4075d41164a95e1a2c563748c2f21ad6248b38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeponoHQ/depono/releases/download/cli-v0.1.0/depono-linux-arm64.tar.gz"
      sha256 "fb816508fcff16a24768a32c6cdd0b34863fdad5e1e95e9a99cb64041e8ee51c"
    end
    on_intel do
      url "https://github.com/DeponoHQ/depono/releases/download/cli-v0.1.0/depono-linux-x86_64.tar.gz"
      sha256 "1c8423ec427315b960c5ae14d555e3bc05006f44a4da4553e3718b04ab325939"
    end
  end

  def install
    bin.install "depono"
  end

  def caveats
    <<~EOS
      Sign in and let git use your Depono token:
        depono login
        depono setup-git
    EOS
  end

  test do
    assert_match "depono #{version}", shell_output("#{bin}/depono --version")
  end
end
