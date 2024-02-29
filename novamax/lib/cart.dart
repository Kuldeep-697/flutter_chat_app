import "package:flutter/material.dart";
import "package:novamax/home_page.dart";

// ProductDetailsAppBar
class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

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
        'My Cart',
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
          iconSize: 20,
        ),
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
          iconSize: 20,
        ),
      ],
    );
  }
}

// Cart Wishlist Button
class CartWishlistButton extends StatelessWidget {
  const CartWishlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: const Center(
                child: Text(
                  'Cart 1',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: const Center(
                child: Text(
                  'Wishlist',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// Available vehicle
Widget vehicleHeightTitle(String title) {
  return Expanded(
    child: Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Center(
        child: Text(title,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
      ),
    ),
  );
}

Widget vehicleCapacityTitle(String title) {
  return Text(title,
      style: const TextStyle(
          fontSize: 9, color: Color(0xFFF00000), fontWeight: FontWeight.w400));
}

Widget vehicleImage(String imagePath) {
  return Image.asset(imagePath, width : 60);
}

Widget vehicleItem(
    String heightTitle, String vehicleImagePath, String capacityTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(children: [
        vehicleHeightTitle(heightTitle),
        const SizedBox(width: 7),
        vehicleImage(vehicleImagePath),
      ]),
      const SizedBox(height: 5),
      vehicleCapacityTitle(capacityTitle)
    ],
  );
}

class AvailableVehicle extends StatelessWidget {
  const AvailableVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Available Vehicle ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            vehicleItem(
                '8 Feet Container',
                'assets/images/champion_vehicle.png',
                'Vehicle : 8fit Champion :  5 cooler Capacity'),
            const SizedBox(height: 10),
            vehicleItem(
                '15 Feet Container',
                'assets/images/truck_vehicle.png',
                'Vehicle : 15fit Champion :  10 cooler Capacity'),
            const SizedBox(height: 10),
            vehicleItem(
                '25 Feet Container',
                'assets/images/bigTruck_vehicle.png',
                'Vehicle : 25fit Champion :  20 cooler Capacity'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CartAppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          CartWishlistButton(),
          AvailableVehicle(),
        ])));
  }
}
