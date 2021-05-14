class OsinfoDbTools < Formula
  desc "Tools for managing the libosinfo database files"
  homepage "https://libosinfo.org"
  url "https://releases.pagure.org/libosinfo/osinfo-db-tools-1.9.0.tar.xz"
  sha256 "80c3fe2ae1062abf56456f52518bd670f9ec3917b7f85e152b347ac6b6faf880"

  depends_on "meson" => :build

  depends_on "gettext"
  depends_on "glib"
  depends_on "json-glib"
  depends_on "libarchive" # need >= 3.0.0
  depends_on "libsoup"

  def install
    args = %W[
      --prefix=#{prefix}
      --werror
    ]
    system "meson build", *args
    system "ninja", "install"
  end

  test do
    system "#{bin}/osinfo-db-path"
  end
end
