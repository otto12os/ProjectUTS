import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectuts/widgets/profile_container_widget.dart';
import 'package:projectuts/screens/transit_page.dart';
import 'route_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> pastTripImages = [
    "images/city1.jpg",
    "images/city2.jpg",
    "images/city3.jpg",
    "images/city4.jpg",
  ];

  final List<String> pastDates = [
    'Rute Transportasi',
    'FAQ',
    'Kritik & Saran',
    'Call Center',
  ];

  final List<String> pastCities = [
    'Lihat seluruh jadwal disini',
    'Pertanyaan yang sering ditanyakan',
    'Kritik & saranmu berguna untuk kami',
    'Hubungi kami jika ada masalah',
  ];

  void _onTap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => RoutePage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FaqPage()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FeedbackPage()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CallCenterPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: const Icon(Icons.menu),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Mau ke kampus mana hari ini?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Text(
                        "Jadwal terdekat",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Center(
                        child: Hero(
                          tag: 'tripHeroTag',
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(_createPageRoute());
                            },
                            child: Container(
                              width: 380,
                              height: 320,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/mount3.jpg"),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 190),
                                  Text(
                                    '10.00 WIB',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade50,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Bus akan tiba 5 menit lagi!',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 330,
                        left: 30,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 500,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: ProfileContainerWidget(
                                        images: "images/pro1.jpg"),
                                  ),
                                  Positioned(
                                    left: 40,
                                    child: ProfileContainerWidget(
                                        images: "images/pro2.jpg"),
                                  ),
                                  Positioned(
                                    left: 82,
                                    child: ProfileContainerWidget(
                                        images: "images/pro3.jpg"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Layanan Kami",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 5),
              Column(
                children: List.generate(pastTripImages.length, (index) {
                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(pastTripImages[index]),
                            opacity: 1,
                            colorFilter: const ColorFilter.mode(
                                Colors.black38, BlendMode.darken),
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 110),
                            Text(
                              pastDates[index],
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade50,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              pastCities[index],
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TransitPage(
        onScrollToTop: () {
          Navigator.of(context).pop();
        },
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

// class RoutePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Rute Transportasi')),
//       body: Center(child: Text('Content for Rute Transportasi')),
//     );
//   }
// }

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQ')),
      body: Center(child: Text('INI KONTEN FAQ')),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kritik & Saran')),
      body: Center(child: Text('INI KONTEN KRITIK DAN SARAN')),
    );
  }
}

class CallCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Center')),
      body: Center(child: Text('INI KONTEN CALL CENTER')),
    );
  }
}
