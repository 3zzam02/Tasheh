import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable_widgets/couponform.dart';

const startallignment = Alignment.topLeft;
const endallignment = Alignment.bottomRight;

class Shop_Page extends StatelessWidget {
  const Shop_Page(this.startShop, {super.key});
  final void Function() startShop;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CouponForm(copountitle: '10% off Clothing'),
              OutlinedButton.icon(
                onPressed: startShop,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 155, 82, 82),
                ),
                icon: const Icon(Icons.add_card,color: Colors.white,),
                label: Text(
                  'Get Coupon                                      Price = 500',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 226, 205, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              const CouponForm(copountitle: '10% off Groceries'),
              OutlinedButton.icon(
                onPressed: startShop,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 155, 82, 82),
                ),
                icon: const Icon(Icons.add_card,color: Colors.white,),
                label: Text(
                  'Get Coupon                                     Price = 500',
                  softWrap: true,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 226, 205, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const CouponForm(copountitle: '10% off Electronics'),
              ButtonTheme(
                minWidth: 50.0,
                height: 10.0,
                child: OutlinedButton.icon(
                  onPressed: startShop,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 155, 82, 82),
                  ),
                  icon: const Icon(Icons.add_card,color: Colors.white,),
                  label: Text(
                    'Get Coupon                                     Price = 700',
                    softWrap: true,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 226, 205, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
