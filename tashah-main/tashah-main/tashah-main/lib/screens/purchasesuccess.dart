import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseSuccess extends StatelessWidget {
  PurchaseSuccess(this.startShop, {super.key});
  final void Function() startShop;
  String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/copoun.jpg',
          width: 300,
        ),
        const SizedBox(height: 10),
        Text(
          'Purchase Success !',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Text(
          'Here is your Code : ',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          getRandomString(10),
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        OutlinedButton.icon(
            onPressed: startShop,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_back),
            label: Text(
              'Go back',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 226, 205, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ))
      ]),
    );
  }
}
