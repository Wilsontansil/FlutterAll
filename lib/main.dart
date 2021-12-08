import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainState(),
    );
  }
}

class MainState extends StatefulWidget {
  const MainState({Key? key}) : super(key: key);

  @override
  _MainStateState createState() => _MainStateState();
}

class _MainStateState extends State<MainState> {
  int pageStatus = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        pageStatus = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: pageManager(pageStatus, mediaQuery),
      ),
    );
  }
}

Widget pageManager(int pageState, MediaQueryData mediaQuery) {
  if (pageState == 0) {
    return splashScreen();
  } else if (pageState == 1) {
    return menu(mediaQuery);
  } else {
    return splashScreen();
  }
}

Widget splashScreen() {
  return Stack(
    children: [
      Image.asset("assets/Pattern.png",
          fit: BoxFit.cover, width: double.infinity, height: double.infinity),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Logo.png",
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Foody",
              style: TextStyle(
                  fontFamily: "BentonSans Bold",
                  fontSize: 35,
                  color: Color(0xAA007d20)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Saingan Grab Dan Gojek Brooo!!!")
          ],
        ),
      )
    ],
  );
}

Widget menu(MediaQueryData mediaQuery) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(width: 2, color: Colors.white),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xAA404040),
                        spreadRadius: .05,
                        blurRadius: 5,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: const Icon(
                    Iconsax.wallet_1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp 285.000",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "My Balance",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Iconsax.search_normal,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Iconsax.message_notif,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Iconsax.card_tick,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}
