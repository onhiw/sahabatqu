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

  DoaModel(this.nomor, this.nama, this.arab, this.arti);
}
