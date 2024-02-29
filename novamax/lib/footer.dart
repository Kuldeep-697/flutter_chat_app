import 'package:flutter/material.dart';
import 'package:novamax/home_page.dart';
import 'package:novamax/order_summary.dart';
import 'package:novamax/purchase_power.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  ElevatedButton buildFooterButton({
    required String imagePath,
    required String label,
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              imagePath,
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF514F4F),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 3,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: buildFooterButton(
              imagePath: 'assets/images/home.png',
              label: 'Home',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ),
          Expanded(
            child: buildFooterButton(
              imagePath: 'assets/images/order.png',
              label: 'Order',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OrderSummary()));
              },
            ),
          ),
          Expanded(
            child: buildFooterButton(
              imagePath: 'assets/images/purchase-power.png',
              label: 'Purchase Power',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PurchasePower()));
              },
            ),
          ),
          Expanded(
            child: buildFooterButton(
              imagePath: 'assets/images/settings.png',
              label: 'Settings',
              onPressed: () {
                // Handle settings button press
              },
            ),
          ),
        ],
      ),
    );
  }
}
