import 'package:flutter/material.dart';
import 'package:novamax/footer.dart';
import 'package:novamax/home_page.dart';

// PurchasePowerAppBar
class PurchasePowerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PurchasePowerAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF0F7FF),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 20,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
      title: const Text(
        'Purchase Power',
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_outline),
          onPressed: () {
            // Handle filter button tap
          },
          iconSize: 20,
          padding: EdgeInsets.zero,
        ),
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            // Handle filter button tap
          },
          iconSize: 20,
          padding: EdgeInsets.zero,
        ),
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {
            // Handle filter button tap
          },
          iconSize: 20,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

Widget purchasePowerItems(String imagePath, String title, String text) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0x001E1E1E),
          Colors.black,
        ],
      ),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF),
                shadows: [
                  Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                    shadows: [
                      Shadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: Colors
                            .white,
                        width: 1.5,
                      ),
                    ),
                    child: Image.asset('assets/images/next-arrow.png',))
              ],
            )
          ]),
    ),
  );
}

class PurchasePower extends StatelessWidget {
  const PurchasePower({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PurchasePowerAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              purchasePowerItems('assets/images/purchase-power-img1.png',
                  'Mumbai Trip', 'Need 500 coolers to claim this reward'),
              const SizedBox(height: 10),
              purchasePowerItems('assets/images/purchase-power-img2.png',
                  'Thailand Trip', 'Need 1000 coolers to claim this reward'),
              const SizedBox(height: 10),
              purchasePowerItems('assets/images/purchase-power-img3.png',
                  'Dubai Trip', 'Need 2000 coolers to claim this reward')
            ],
          ),
        ),
        bottomNavigationBar: const Footer(),
        );
  }
}
