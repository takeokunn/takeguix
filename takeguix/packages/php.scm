(define-module (takeguix packages php)
  #:use-module (gnu packages)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:))

(define-public php-81
  (package
   (name "php-81")
   (version "8.1.10")
   (home-page "https://github.com/php/php-src/archive/refs/tags/")
   (source (origin
            (method url-fetch)
            (uri (string-append home-page
                                "php-" version ".tar.gz"))
            (sha256
             (base32
              "19mpxg060l6yn1frgp0gal9jh9y6s307by0xdggb4wv2crvb54pn"))
            (modules '((guix build utils)))))
   (build-system gnu-build-system)
   (arguments
    `(#:configure-flags
      (let-syntax ((with (syntax-rules ()
                           ((_ option input)
                            (string-append option "="
                                           (assoc-ref %build-inputs input))))))
        (list (with "--with-bz2" "bzip2")
              (with "--with-curl" "curl")
              (with "--with-gdbm" "gdbm")
              (with "--with-gettext" "glibc")
              (with "--with-gmp" "gmp")
              (with "--with-ldap" "openldap")
              (with "--with-ldap-sasl" "cyrus-sasl")
              (with "--with-pdo-pgsql" "postgresql")
              (with "--with-pdo-sqlite" "sqlite")
              (with "--with-pgsql" "postgresql")
              (with "--with-pspell" "aspell")
              (with "--with-readline" "readline")
              (with "--with-sqlite3" "sqlite")
              (with "--with-tidy" "tidy")
              (with "--with-xsl" "libxslt")
              (with "--with-zlib-dir" "zlib")
              "--with-external-pcre"
              "--with-external-gd"
              "--with-iconv"
              "--with-openssl"
              "--with-mysqli"
              "--with-pdo-mysql"
              "--with-zip"
              "--with-zlib"
              "--enable-bcmath"
              "--enable-calendar"
              "--enable-dba=shared"
              "--enable-exif"
              "--enable-flatfile"
              "--enable-fpm"
              "--enable-ftp"
              "--enable-gd"
              "--enable-inifile"
              "--enable-intl"
              "--enable-mbstring"
              "--enable-pcntl"
              "--enable-sockets"))))
   (inputs
    `(("aspell" ,aspell)
      ("bzip2" ,bzip2)
      ("curl" ,curl)
      ("cyrus-sasl" ,cyrus-sasl)
      ("gd" ,gd)
      ("gdbm" ,gdbm)
      ("glibc" ,glibc)
      ("gmp" ,gmp)
      ("gnutls" ,gnutls)
      ("icu4c" ,icu4c)
      ("libgcrypt" ,libgcrypt)
      ("libpng" ,libpng)
      ("libxml2" ,libxml2)
      ("libxslt" ,libxslt)
      ("libx11" ,libx11)
      ("libzip" ,libzip)
      ("oniguruma" ,oniguruma)
      ("openldap" ,openldap)
      ("openssl" ,openssl)
      ("pcre" ,pcre2)
      ("postgresql" ,postgresql)
      ("readline" ,readline)
      ("sqlite" ,sqlite)
      ("tidy" ,tidy)
      ("zlib" ,zlib)))
   (native-inputs
    `(("pkg-config" ,pkg-config)
      ("bison" ,bison)
      ("intltool" ,intltool)
      ("procps" ,procps)))
   (synopsis "PHP programming language")
   (description
    "PHP (PHP Hypertext Processor) is a server-side (CGI) scripting
language designed primarily for web development but is also used as
a general-purpose programming language.  PHP code may be embedded into
HTML code, or it can be used in combination with various web template
systems, web content management systems and web frameworks." )
   (license (list
             (license:non-copyleft "file://LICENSE")
             (license:non-copyleft "file://Zend/LICENSE")
             license:lgpl2.1
             license:lgpl2.1+
             license:bsd-2
             license:expat))))
