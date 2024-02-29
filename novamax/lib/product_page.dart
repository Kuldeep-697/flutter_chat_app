import 'package:flutter/material.dart';
import 'package:novamax/home_page.dart';
import 'package:novamax/product_details.dart';

// ProductListingAppbar
class ProductListingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductListingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Products',
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
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
      actions: [
        IconButton(
          icon: const Icon(Icons.search, size: 20),
          onPressed: () {
            // Handle search action
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {
            // Handle filter button tap
          },
        ),
      ],
    );
  }
}

// ProductItem
Widget productListingImage(String imagePath) {
  return Image.asset(
    imagePath,
    width: 91,
    height: 88,
    fit: BoxFit.cover,
  );
}

Widget productListingTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color(0xFF000000),
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );
}

Widget productListingSubTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color(0xFF514F4F),
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );
}

Widget productListingPricing(String pricing) {
  return Text(
    pricing,
    style: const TextStyle(
      color: Color(0xFF000000),
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );
}

Widget productListingRating(String rating) {
  return Row(
    children: [
      const Icon(
        Icons.star,
        color: Color(0xFFFFA707),
        size: 10,
      ),
      const SizedBox(width: 4),
      Text(
        rating,
        style: const TextStyle(
          color: Color(0xFF000000),
          fontSize: 9,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(width: 4),
      Container(
        width: 1,
        height: 9,
        decoration: const BoxDecoration(color: Color(0xFF808080)),
      ),
      const SizedBox(width: 4),
      const Text(
        '155',
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 9,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(width: 4),
      Image.asset('assets/images/promo-code-checkbox.png', height: 10),
    ],
  );
}

class ProductQuantitySelector extends StatefulWidget {
  const ProductQuantitySelector({super.key});

  @override
  ProductQuantitySelectorState createState() => ProductQuantitySelectorState();
}

class ProductQuantitySelectorState extends State<ProductQuantitySelector> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        border: Border.all(
          color: const Color(0xFF000000),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: decrement,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.remove, size: 14),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            '$quantity',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF28B658),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 15),
          InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: increment,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.add, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool showQuantitySelector = false;

  Widget productListingButton() {
    return SizedBox(
      height: 28,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            showQuantitySelector = true;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductDetails(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xFFF2F2F2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                productListingImage('assets/images/product-img.png'),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productListingTitle(
                        'Novamax Rambo Junior 75 L Commercial Air Cooler...',
                      ),
                      const SizedBox(height: 4),
                      productListingSubTitle(
                        '(Grey, Gloster 125 L Desert Air Cooler With Powerful Air Throw, Honeycomb Cooling)',
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              productListingPricing('₹ 19,290'),
                              productListingRating('4.5'),
                            ],
                          ),
                          const Spacer(),
                          showQuantitySelector
                              ? const ProductQuantitySelector()
                              : productListingButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Row(children: [
          const SizedBox(width: 10),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '1 Item(s)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '1 Quantity(s)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
          const Spacer(),
          const Text(
            '₹19,490',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 38,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              child: const Text(
                'View Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          )
        ]));
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductListingAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
              SizedBox(height: 10),
              ProductItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToCartBar(),
    );
  }
}
