class OsinfoDbTools < Formula
  desc "Tools for managing the libosinfo database files"
  homepage "https://libosinfo.org"
  url "https://releases.pagure.org/libosinfo/osinfo-db-tools-1.9.0.tar.xz"
  sha256 "255f1c878bacec70c3020ff5a9cb0f6bd861ca0009f24608df5ef6f62d5243c0"

  depends_on "pkg-config" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  depends_on "gettext"
  depends_on "glib"
  depends_on "json-glib"
  depends_on "libarchive" # need >= 3.0.0
  depends_on "libsoup"

  def install
    args = %W[
      --prefix=#{prefix}
      --localstatedir=#{var}
      --sysconfdir=#{etc}
      --werror
    ]
    system "meson", "build", *args
    system "ninja", "-Cbuild", "install"
  end

  test do
    system "#{bin}/osinfo-db-path"
    system "#{bin}/osinfo-db-validate"
  end
end
