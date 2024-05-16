import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseFailed extends StatelessWidget {
  const PurchaseFailed(this.startShop, {super.key});
  final void Function() startShop;

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
          'Purchase Failed !',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 255, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Text(
          'Insufficient Funds !',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 255, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        OutlinedButton.icon(
            onPressed: startShop,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 161, 39, 39),
            ),
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 226, 205, 255),
            ),
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
