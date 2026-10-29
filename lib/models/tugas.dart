
class Tugas {
  final String judul;
  final String mataKuliah;
  final String tenggat;
  final bool selesai;

  const Tugas({
    required this.judul,
    required this.mataKuliah,
    required this.tenggat,
    this.selesai = false,
  });
}
