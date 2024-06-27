import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectuts/screens/home_screen.dart';
import 'package:projectuts/screens/register_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/login.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Selamat datang di Aplikasi Transportasi Kampus',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 33,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5
                        ..color = Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Selamat datang di Aplikasi Transportasi Kampus',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 33,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    left: 33,
                    right: 33),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // awal navigasi
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomePage(),
                            ),
                          );
                          //akhir navigasi
                        },
                        child: const Text('LOGIN'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Belum mempunyai akun?',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // awal navigasi
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Register(),
                            ),
                          );
                          //akhir navigasi
                        },
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
