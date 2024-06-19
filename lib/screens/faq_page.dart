import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Map<String, String>> faqs = [
    {
      "question": "Apa itu FAQ?",
      "answer": "FAQ adalah singkatan dari Frequently Asked Questions, yaitu pertanyaan yang sering ditanyakan dan jawabannya."
    },
    {
      "question": "Mengapa FAQ penting?",
      "answer": "FAQ membantu pengguna untuk mendapatkan jawaban atas pertanyaan umum tanpa harus menghubungi customer support."
    },
    {
      "question": "Bagaimana cara menambahkan pertanyaan ke FAQ?",
      "answer": "Anda dapat menambahkan pertanyaan baru ke FAQ dengan mengklik tombol Tambah Pertanyaan dan mengisi formulir yang tersedia."
    },
    {
      "question": "Apakah FAQ akan diperbarui secara berkala?",
      "answer": "Ya, FAQ akan diperbarui secara berkala untuk mencakup pertanyaan-pertanyaan baru yang muncul."
    },
    {
      "question": "Apakah tersedia transportasi kampus?",
      "answer": "Ya, tersedia transportasi kampus berupa bus yang menghubungkan berbagai area di dalam kampus."
    },
    {
      "question": "Dimana saya bisa menemukan jadwal bus kampus?",
      "answer": "Jadwal bus kampus bisa dilihat di papan informasi di berbagai titik berhenti bus kampus atau di situs web resmi kampus."
    },
    {
      "question": "Apakah ada biaya untuk menggunakan bus kampus?",
      "answer": "Tidak, penggunaan bus kampus gratis bagi mahasiswa dan staf kampus."
    },
    {
      "question": "Berapa sering bus kampus beroperasi?",
      "answer": "Bus kampus beroperasi setiap hari selama jam kerja kampus. Jadwal rinci dapat dilihat di papan informasi atau situs web kampus."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index]["question"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  faqs[index]["answer"]!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}