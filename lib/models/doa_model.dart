class DoaModel {
  String? nama;
  String? arab;
  String? arti;
  String? nomor;

  String getNomor() {
    return nomor!;
  }

  String getNama() {
    return nama!;
  }

  String getArab() {
    return arab!;
  }

  String getArti() {
    return arti!;
  }

  DoaModel(String nomor, String nama, String arab, String arti) {
    this.nomor = nomor;
    this.nama = nama;
    this.arab = arab;
    this.arti = arti;
  }
}
