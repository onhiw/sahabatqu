class Asma {
  String ayat, bacaan, arti, no;

  String getAyat() {
    return ayat;
  }

  String getBacaan() {
    return bacaan;
  }

  String getArti() {
    return arti;
  }

  String getNo() {
    return no;
  }

  Asma(String no, String ayat, String bacaan, String arti) {
    this.no = no;
    this.ayat = ayat;
    this.bacaan = bacaan;
    this.arti = arti;
  }
}
