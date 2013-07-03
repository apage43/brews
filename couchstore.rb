require 'formula'

class Couchstore < Formula
    homepage 'http://github.com/couchbase/couchstore'
    head 'git://github.com/couchbase/couchstore.git'

    depends_on :automake => :build
    depends_on :autoconf => :build
    depends_on :libtool => :build
    depends_on 'snappy' => :build
    depends_on 'icu4c' => :build
    depends_on 'v8' => :build

    def install
        system "echo \"m4_define([VERSION_NUMBER], [HEAD])\" > m4/version.m4"
        system "./config/autorun.sh"
        system "./configure", "--prefix=#{prefix}"
        system "make install"
    end
end

