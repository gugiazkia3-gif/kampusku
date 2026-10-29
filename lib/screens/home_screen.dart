
import 'package:flutter/material.dart';
import '../models/mata_kuliah.dart';
import '../models/tugas.dart';
import '../models/pengumuman.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<MataKuliah> mataKuliah = const [
    MataKuliah(
      nama: 'Pemrograman Mobile',
      dosen: 'Bapak Andi Pratama',
      jadwal: 'Senin, 09.00',
      kode: 'IF301',
    ),
    MataKuliah(
      nama: 'Basis Data',
      dosen: 'Ibu Siti Rahma',
      jadwal: 'Selasa, 10.00',
      kode: 'IF302',
    ),
    MataKuliah(
      nama: 'Rekayasa Perangkat Lunak',
      dosen: 'Bapak Budi Santoso',
      jadwal: 'Rabu, 13.00',
      kode: 'IF303',
    ),
  ];

  final List<Tugas> daftarTugas = const [
    Tugas(
      judul: 'Membuat proyek Flutter',
      mataKuliah: 'Pemrograman Mobile',
      tenggat: '30 Oktober 2026',
    ),
    Tugas(
      judul: 'Membuat ERD database',
      mataKuliah: 'Basis Data',
      tenggat: '2 November 2026',
    ),
  ];

  final List<Pengumuman> pengumuman = const [
    Pengumuman(
      judul: 'Jadwal praktikum',
      isi: 'Praktikum dilaksanakan sesuai jadwal kelas masing-masing.',
      tanggal: '28 Oktober 2026',
    ),
    Pengumuman(
      judul: 'Pengumpulan tugas',
      isi: 'Pastikan tugas diunggah melalui E-learning sebelum tenggat.',
      tanggal: '27 Oktober 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final titles = ['KampusKu', 'Mata Kuliah', 'Tugas'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Belum ada notifikasi baru.'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildBeranda(),
            _buildMataKuliah(),
            _buildTugas(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Kuliah',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Tugas',
          ),
        ],
      ),
    );
  }

  Widget _buildBeranda() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: const Color(0xFF2446A8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang di',
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              SizedBox(height: 5),
              Text(
                'KampusKu 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kelola kegiatan kuliahmu dengan lebih mudah.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Ringkasan Akademik',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _summaryCard(
                Icons.menu_book,
                '${mataKuliah.length}',
                'Mata Kuliah',
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _summaryCard(
                Icons.assignment,
                '${daftarTugas.length}',
                'Tugas Aktif',
                Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Daftar Pengumuman',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...pengumuman.map(
          (item) => Card(
            elevation: 0,
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.campaign_outlined),
              ),
              title: Text(
                item.judul,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${item.isi}\n${item.tanggal}'),
              isThreeLine: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMataKuliah() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Mata Kuliah Semester Ini',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...mataKuliah.map(
          (item) => Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const CircleAvatar(
                child: Icon(Icons.book_outlined),
              ),
              title: Text(
                item.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${item.kode}\n${item.dosen}\n${item.jadwal}',
              ),
              isThreeLine: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTugas() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Tugas yang Harus Diselesaikan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...daftarTugas.map(
          (item) => Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(
                Icons.assignment_late_outlined,
                color: Colors.orange,
                size: 32,
              ),
              title: Text(
                item.judul,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${item.mataKuliah}\nTenggat: ${item.tenggat}',
              ),
              isThreeLine: true,
              trailing: Icon(
                item.selesai ? Icons.check_circle : Icons.schedule,
                color: item.selesai ? Colors.green : Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _summaryCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
