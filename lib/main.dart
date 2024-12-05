import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 59, 59, 59),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String nama = "Axel Juanito Parlindungan Sibarani";
  final String pekerjaan = "Mahasiswa Ilmu Komputer";
  final String email = "Axeljuanito04@gmail.com";
  final String noHp = "082345768";
  final String alamat = "Sukabumi";
  final String npm = "065122199";
  final String usia = "20 Tahun";
  final String prodi = "Ilmu Komputer";
  final String fakultas = "Ilmu Pengetahuan Alam";
  final String universitas = "Universitas Pakuan";
  final String description =
      "Nama saya Axel Juanito Parlindungan Sibarani. Biasanya saya dipanggil Axel. Saya lahir di Sukabumi tepatnya di desa Cipeuteuy Kec.Kabandungan. Pendidikan terakhir saya SMA lebih tepatnya di SMAN 1 Kabandungan. Saat ini saya melanjutkan ke jenjang kuliah di Universitas Pakuan Bogor dengan jurusan Ilmu Komputer di fakultas Matematika dan Ilmu Pengetahuan Alam.";

  final List<Map<String, String>> services = [
    {
      'title': 'Creative Design',
      'description': 'Menghasilkan desain kreatif yang menarik dan fungsional.',
      'image':
          'assets/images/Keahlian/photoshop.jpeg', // Path gambar untuk Creative Design
    },
    {
      'title': 'Branding',
      'description':
          'Membantu membangun identitas merek yang kuat dan konsisten.',
      'image':
          'assets/images/Keahlian/ilustrator.jpeg', // Path gambar untuk Branding
    },
    {
      'title': 'User Interface',
      'description': 'Membuat antarmuka pengguna yang intuitif dan menarik.',
      'image':
          'assets/images/Keahlian/Figma.jpg', // Path gambar untuk User Interface
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'assets/images/background.jpg/bangunan kampus.jpg', // Ganti dengan path gambar latar belakang
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/profile.jpg/Foto profil.jpg'), // Ganti dengan path gambar profil
                        ),
                        SizedBox(height: 16),
                        Text(
                          nama,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          pekerjaan,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          65), // Menambahkan jarak untuk menurunkan "Tentang Saya"
                  Text(
                    'Tentang Saya',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.white54),
                  SizedBox(height: 16),
                  Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Table(
                    columnWidths: {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth()
                    },
                    children: [
                      _buildTableRow('Nama', nama),
                      _buildTableRow('NPM', npm),
                      _buildTableRow('Usia', usia),
                      _buildTableRow('Prodi', prodi),
                      _buildTableRow('Fakultas', fakultas),
                      _buildTableRow('Alamat', alamat),
                      _buildTableRow('Email', email),
                      _buildTableRow('Universitas', universitas),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Keahlian Saya',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: services.map((service) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        child: Card(
                          color: Colors.grey[850],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  service['image']!,
                                  height: 48,
                                  width: 48,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  service['title']!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  service['description']!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Text('$title:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        Text(value, style: TextStyle(color: Colors.white70)),
      ],
    );
  }
}
