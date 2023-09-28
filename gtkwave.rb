class Gtkwave < Formula
  desc "GTKWave"
  homepage "https://gtkwave.sourceforge.net"
  license "GPL-2.0-or-later"
  head "https://github.com/gtkwave/gtkwave.git", branch: "master"

  depends_on "desktop-file-utils" => :build # for update-desktop-database
  depends_on "shared-mime-info" => :build 
  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+3"

  patch do
	url "https://raw.githubusercontent.com/randomplum/homebrew-gtkwave/main/macos_compat.diff"
	sha256 "d55b5314564d8461531e0d7ce63ffb004f769f381e4468181257dd3016fe919b"
	end

  def install
    ENV["DESTDIR"] = "/"
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

end
