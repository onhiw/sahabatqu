class AsmaModel {
  String? ayat, bacaan, arti, no;

  String getAyat() {
    return ayat!;
  }

  String getBacaan() {
    return bacaan!;
  }

  String getArti() {
    return arti!;
  }

  String getNo() {
    return no!;
  }

  AsmaModel(this.no, this.ayat, this.bacaan, this.arti);
}
