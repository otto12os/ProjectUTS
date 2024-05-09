import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  final VoidCallback onScrollToTop;
  const InfoPage({Key? key, required this.onScrollToTop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> tripSummaryTitle = [
      // Rute
      'Kampus A menuju Kampus B',
      'Kampus B menuju Kampus C',
      'Kampus C menuju Kampus A',
    ];
    List<String> tripSummaryHI = [
      // Keterangan
      'Lihat jadwalnya disini!',
      'Lihat jadwalnya disini!',
      'Lihat jadwalnya disini!',
    ];
    List<String> tripSummarySubtitle = [
      // Keterangan
      'Coming Soon!',
      'Coming Soon!',
      'Coming Soon!',
    ];
    final tripSummaryPic = [
      // Gambar
      "images/mount1.jpg",
      "images/mount1.jpg",
      "images/mount1.jpg",
    ];
    return NotificationListener<ScrollNotification>( 
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.minScrollExtent) {
          onScrollToTop();
        }
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
          backgroundColor: Colors.blue,
          child: const Icon(CupertinoIcons.pen, color: Colors.white,),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey.shade500,
            size: 39,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.cancel),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/pro4.jpg"),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lihat jadwal lainnya!',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3,
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 300,
                              width: 300,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(tripSummaryPic[index]),
                                  opacity: 0.5,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black38, BlendMode.darken),
                                ),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tripSummaryTitle[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade50,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 110,),
                                    Text(
                                      tripSummaryHI[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(
                                      tripSummarySubtitle[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade200,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
