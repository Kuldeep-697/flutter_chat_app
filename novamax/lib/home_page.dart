import 'package:flutter/material.dart';
import 'package:novamax/footer.dart';
import 'package:novamax/cart.dart';
import 'package:novamax/product_page.dart';

//appbar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF0F7FF),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/home-page-logo.png',
              width: 32, height: 32),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Novamax',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Pro seller',
                style: TextStyle(
                  color: Color(0xFF2284F8),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Cart()),
          );
            },
          ),
        ],
      ),
    );
  }
}

// Recharge
class Recharge extends StatelessWidget {
  const Recharge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE0EFFF),
        border: Border(
          top: BorderSide(
            color:  Color(0xFF2284F8),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Row(
        children: [
          const Text(
            'Total Balance :',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 7),
          const Text(
            'Rs 500/-',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.91),
              backgroundColor: const Color(0xFF2284F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
          
              ),
            ),
            child: const Row(
              children: [
                Text(
                  'Recharge Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//section 1
class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 190,
      child: Image.asset(
        'assets/images/banner.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

//section 2
Widget categoryItem(String imagePath, String title) {
  return Expanded(
    child: GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Image.asset(imagePath,
              width: double.infinity, height: 111, fit: BoxFit.cover),
          const SizedBox(height: 7),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              categoryItem(
                  'assets/images/category-image1.png', 'Desert Cooler'),
              const SizedBox(width: 7),
              categoryItem(
                  'assets/images/category-image2.png', 'Commercial Cooler'),
            ],
          ),
        ],
      ),
    );
  }
}

//section 3
class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Deal Of the Day',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 7),
          Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xFF0D0D0D),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Daily Deal',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Image.asset('assets/images/deal-timing.png',
                    height: 27, width: 150),
                const Spacer(),
                Image.asset('assets/images/deal-product.png',
                    height: 40, width: 40),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//section 4
Widget productImage(String imagePath) {
  return Image.asset(imagePath, height: 146);
}

Widget productTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Color(0xFF1E1E1E),
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget productRating(String rating) {
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

Widget productPricing(String price) {
  return Text(
    price,
    style: const TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget addToCartButton() {
  return SizedBox(
    height: 26,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: const Text(
        'Add to Cart',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
    ),
  );
}

Widget productElement(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: const Color(0xFFF6FAFF),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(1, 1),
          blurRadius: 5,
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProductPage()),
        );
      },
      child: Column(
        children: [
          productImage('assets/images/product-img.png'),
          Container(
            color: const Color(0xFFF6FAFF),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productTitle(
                    'Novamax Rambo Junior 75 L \nCommercial Air Cooler...'),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          productRating('4.5'),
                          productPricing('₹ 19,490'),
                        ]),
                    const SizedBox(width: 12),
                    addToCartButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Best PRODUCTS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 7),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                productElement(context),
                const SizedBox(width: 7),
                productElement(context),
                const SizedBox(width: 7),
                productElement(context),
                const SizedBox(width: 7),
                productElement(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//section 5
Widget featureImage(String imagePath) {
  return Image.asset(
    imagePath,
    width: double.infinity,
    height: 102,
    fit: BoxFit.cover,
  );
}

Widget featureButton() {
  return Container(
    color: const Color(0xFFF6FAFF),
    padding: const EdgeInsets.all(5),
    child: const Row(
      children: [
        Text(
          'Explore More',
          style: TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_right_alt,
          size: 18,
        ),
      ],
    ),
  );
}

Widget featureItem(String imagePath) {
  return Expanded(
    child: GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          featureImage(imagePath),
          featureButton(),
        ],
      ),
    ),
  );
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Features',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            featureItem('assets/images/feature-img1.png'),
            const SizedBox(width: 5),
            featureItem('assets/images/feature-img2.png'),
            const SizedBox(width: 5),
            featureItem('assets/images/feature-img3.png'),
          ],
        ),
      ]),
    );
  }
}

//section 6
class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: 180,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/offer-bg-img.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(children: [
            Image.asset('assets/images/offer-product-img.png',
                width: 90, height: 116),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  MainAxisAlignment.center, // align content center verically
              children: [
                const Text(
                  'SEASON',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E1E1E)),
                ),
                const Text(
                  'OFFER',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E1E1E)),
                ),
                const Text(
                  'Hurry! Unwrap the savings with our limited-time \n offer your ticket to exclusive deals awaits!',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF514F4F)),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Get it Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            )
          ])),
    );
  }
}

//section 7
Widget trendsImage(String imagePath) {
  return Image.asset(
    imagePath,
    width: double.infinity,
    height: 126,
    fit: BoxFit.cover,
  );
}

Widget trendsTitle(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xFF1E1E1E),
      fontSize: 7,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  );
}

Widget trendsRating(String rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
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

Widget trendPositionedImage(String imagePath) {
  return Image.asset(imagePath, height: 32);
}

Widget trendsItem(String trendsImagePath, String trendTitle, String trendRating,
    String trendPositionedImagePath) {
  return Expanded(
    child: GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6.0),
                topRight: Radius.circular(6.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              border: Border.all(
                color: const Color(0xFFBCBCBC),
                width: 1.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                trendsImage(trendsImagePath),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 14, 8, 4),
                  child: Column(
                    children: [
                      trendsTitle(trendTitle),
                      const SizedBox(height: 2),
                      trendsRating(trendRating),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 44,
            left: 0,
            right: 0,
            child: trendPositionedImage(trendPositionedImagePath),
          ),
        ],
      ),
    ),
  );
}

class Trends extends StatelessWidget {
  const Trends({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(children: [
        const Text(
          'New Trends',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 50,
          height: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.811),
            color: const Color(0xFF2284F8),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            trendsItem(
                'assets/images/trends-img1.png',
                'Novamax Rambo Junior 75 L Commercial',
                '4.5',
                'assets/images/trends-positioned-img.png'),
            const SizedBox(width: 5),
            trendsItem(
                'assets/images/trends-img2.png',
                'Novamax Rambo Junior 75 L Commercial',
                '4.5',
                'assets/images/trends-positioned-img.png'),
            const SizedBox(width: 5),
            trendsItem(
                'assets/images/trends-img3.png',
                'Novamax Rambo Junior 75 L Commercial',
                '4.5',
                'assets/images/trends-positioned-img.png'),
          ],
        ),
      ]),
    );
  }
}

//section 8
Widget reviewsImages(String imagePath, double height) {
  return GestureDetector(
    onTap: () {},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          const SizedBox(height: 10),
          const Text(
            'Retailer Reviews across India',
            style: TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Hear what our Retailer have to say about their experience with NovaMax',
            style: TextStyle(
              color: Color(0xFF514F4F),
              fontSize: 9,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: Column(children: [
                reviewsImages('assets/images/review-img1.png', 98),
                const SizedBox(height: 7),
                reviewsImages('assets/images/review-img2.png', 98),
              ]),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: reviewsImages('assets/images/review-img3.png', 203),
            )
          ]),
        ]));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Recharge
            Recharge(),
    
            //section 1
            Banner(),
    
            //section 2
            Category(),
    
            //section 3
            Deals(),
    
            //section 4
            Products(),
    
            //section 5
            Features(),
    
            //section 6
            Offers(),
    
            //section 7
            Trends(),
    
            //section 8
            Reviews(),
          ],
        ),
      ),
      //footer
      bottomNavigationBar: Footer(),
    );
  }
}
