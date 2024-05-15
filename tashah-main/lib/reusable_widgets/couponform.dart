import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponForm extends StatelessWidget {
  const CouponForm({super.key, required this.copountitle,});
  final String copountitle ;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/copoun.jpg',
                  width: 300,
                ),
                Text(
                  copountitle,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 226, 205, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                
              ],
            ),
          ),
        ));
  }
}
