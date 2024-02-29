import 'package:flutter/material.dart';
import 'package:novamax/home_page.dart';
import "package:novamax/product_page.dart";

// ProductDetailsAppBar
class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({super.key});

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
            MaterialPageRoute(builder: (context) => const ProductPage()),
          );
        },
      ),
      title: const Text(
        'Products Details',
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

// Banner section
Widget borderBottom() {
  return Container(
    height: 0.5,
    color: const Color(0xFFB0B0B0),
  );
}

Widget bannerImageColorItem(int color) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.988),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        color: Color(color),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.32),
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
    ),
  );
}

Widget bannerImageColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      bannerImageColorItem(0xFF1E1E1E),
      const SizedBox(width: 5),
      bannerImageColorItem(0xFF4E5464),
      const SizedBox(width: 5),
      bannerImageColorItem(0xFF0E5727),
      const SizedBox(width: 5),
      bannerImageColorItem(0xFF383939),
      const SizedBox(width: 5),
      bannerImageColorItem(0xFFB7B7B7),
    ],
  );
}

Widget productDetailsTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget productDetailsSubTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Color(0xFF808080),
    ),
  );
}

Widget productDetailsPrice(String price) {
  return Row(
    children: [
      const Text(
        'Price : ',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        price,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBABABA),
        ),
      ),
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
      height: 30,
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

Widget productDetailsAddProduct() {
  return const Row(
    children: [
      Text(
        'Add Product',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBABABA),
        ),
      ),
      Spacer(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5 Minimum Quantity for one order',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w400,
              color: Color(0xFF949494),
            ),
          ),
          Text(
            ' *',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(width: 8),
      ProductQuantitySelector(),
    ],
  );
}

class ProductDetailsBanner extends StatefulWidget { 
  const ProductDetailsBanner({super.key});

  @override
  State<ProductDetailsBanner> createState() => _ProductDetailsBannerState();
}

class _ProductDetailsBannerState extends State<ProductDetailsBanner> {
  String selectedImagePath = 'assets/images/product-img.png';

  void setSelectedImage(String imagePath) {
    setState(() {
      selectedImagePath = imagePath;
    });
  }

  Widget productDetailsBannerMainImage(
      String imagePath, double width, double height) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(
        imagePath,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget productDetailsBannerChildImage(
      String imagePath, double width, double height) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setSelectedImage(imagePath);
        },
        child: Image.asset(
          imagePath,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        productDetailsBannerMainImage(selectedImagePath, double.infinity, 377),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  productDetailsBannerChildImage(
                      'assets/images/product-img1.png', 90, 90),
                  const SizedBox(width: 5),
                  productDetailsBannerChildImage(
                      'assets/images/product-img2.png', 90, 90),
                  const SizedBox(width: 5),
                  productDetailsBannerChildImage(
                      'assets/images/product-img3.png', 90, 90),
                  const SizedBox(width: 5),
                  productDetailsBannerChildImage(
                      'assets/images/product-img3.png', 90, 90),
                ],
              ),
              const SizedBox(height: 15),
              bannerImageColor(),
              const SizedBox(height: 15),
              const Text(
                'Novamax',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              productDetailsTitle(
                  'Novamax Rambo Junior 75 L Commercial Air Cooler...'),
              const SizedBox(
                width: 3,
              ),
              productDetailsSubTitle(
                  '(Grey, Gloster 125 L Desert Air Cooler With Powerful Air Throw, Honeycomb Cooling)'),
              const SizedBox(height: 15),
              borderBottom(),
              const SizedBox(height: 15),
              productDetailsPrice('₹19,490'),
              const SizedBox(height: 15),
              borderBottom(),
              const SizedBox(height: 15),
              productDetailsAddProduct(),
              const SizedBox(height: 15),
              borderBottom(),
            ],
          ),
        ),
      ],
    );
  }
}

// payment and rewards
class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rewards and Payment Offers',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            color: const Color(0xFFECF5FF),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/reward-img.png',
                      width: 45, height: 32),
                  const SizedBox(width: 14),
                  const SizedBox(
                    width: 160,
                    child: Text(
                      'Earn Upto 50 Reward point on this product',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1E1E1E)),
                    ),
                  ),
                  const Spacer(),
                  const Row(children: [
                    Text(
                      'T&C Applied',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF949494)),
                    ),
                    Text(
                      ' *',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                  ])
                ],
              ),
              const SizedBox(height: 22),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/paytm-payment.png',
                      width: 45, height: 32),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/gpay-payment.png',
                      width: 28, height: 10),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/upi-payment.png',
                      width: 28, height: 10),
                  const SizedBox(width: 5),
                  const Spacer(),
                  const Text(
                    'Flat RS.500 off on all UPI Payments',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E1E1E)),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}

// check status
Widget checkStatusTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
  );
}

Widget checkStatusInput(String hintText) {
  return Expanded(
    child: Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        border: Border.all(
          color: const Color(0xFFB0B0B0),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFBCBCBC),
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            border: InputBorder.none,
          ),
          cursorHeight: 26,
        ),
      ),
    ),
  );
}

Widget checkStatusButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF28B658),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    ),
    child: const Text(
      'Check',
      style: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}

Widget addToCompareButton() {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF1E1E1E),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
    child: const Text('Add to Compare'),
  );
}

Widget promoCode() {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      border: Border.all(
        color: const Color(0xFFB0B0B0),
        width: 0.25,
      ),
      color: const Color(0xFFF6F6F6),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Image.asset('assets/images/promo-code-checkbox.png'),
          const SizedBox(width: 6),
          const Text('Select a promo code',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Color(0xFF808080),
              )),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF28B658),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
            child: const Text('View Offers'),
          )
        ]),
  );
}

class CheckStatus extends StatelessWidget {
  const CheckStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkStatusTitle('Check availability'),
          const SizedBox(height: 5),
          SizedBox(
            height:32,
            child: Row(
              children: [
                checkStatusInput('Enter Coupon Code'),
                checkStatusButton(),
              ],
            ),
          ),
          const SizedBox(height: 7),
          promoCode(),
          const SizedBox(height: 7),
          checkStatusTitle('Check Delivery'),
          const SizedBox(height: 5),
          SizedBox(
            height: 32,
            child: Row(
              children: [
                checkStatusInput('Enter PIN Code'),
                checkStatusButton(),
                addToCompareButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// warranty section
Widget warrantyData(String imagePath, String title) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        width: 42,
        height: 36,
      ),
      const SizedBox(height: 10),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.w500,
          color: Color(0xFF2D2C2C),
        ),
      )
    ],
  );
}

class WarrantyIcons extends StatelessWidget {
  const WarrantyIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFB0B0B0),
              width: 0.5,
            ),
          ),
        ),
        child: Row(children: [
          warrantyData('assets/images/warranty.png', "1 Year Warranty"),
          const Spacer(),
          warrantyData('assets/images/home-service.png', "Home Services"),
          const Spacer(),
          warrantyData('assets/images/free-shipping.png', "Free Shipping"),
          const Spacer(),
          warrantyData('assets/images/gst-billing.png', "GST Billing"),
        ]),
      ),
    );
  }
}

// highlight section
Widget productHighlightImages(
  String imagePath,
) {
  return Container(
    width: 143,
    height: 152,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFD9D9D9),
        width: 1,
      ),
    ),
    child: Image.asset(
      imagePath,
      width: 143,
      height: 152,
      fit: BoxFit.cover,
    ),
  );
}

Widget highlightDataTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget highlightDataPoints(String title) {
  return Row(children: [
    const Icon(Icons.arrow_right, size: 7),
    const SizedBox(width: 3),
    Expanded(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 7,
          color: Color(0xFF808080),
          fontWeight: FontWeight.w500,
        ),
      ),
    )
  ]);
}

Widget productHighlightData() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        highlightDataTitle('Specifications General'),
        const SizedBox(height: 5),
        highlightDataPoints(
            'Air Cooler: Uses fans and heatsinks to dissipate heat.'),
        const SizedBox(height: 3),
        highlightDataPoints(
            'Liquid Cooler: Utilizes a closed-loop liquid cooling system with a pump, radiator, and fan(s).'),
        const SizedBox(height: 3),
        highlightDataPoints(
            'Height, width, and depth of the cooler, which is crucial for compatibility with your system.'),
        const SizedBox(height: 3),
        highlightDataPoints('CPU socket compatibility for CPU coolers.'),
        const SizedBox(height: 3),
        highlightDataPoints('Case compatibility for both CPU and GPU coolers.'),
        const SizedBox(height: 3),
        highlightDataPoints('Size and RPM (Revolutions Per Minute) of fans.'),
        const SizedBox(height: 3),
        highlightDataPoints('Some coolers may have multiple fans.'),
      ],
    ),
  );
}

class ProductHighlight extends StatelessWidget {
  const ProductHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'Product Highlight',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              productHighlightImages('assets/images/highlight-img1.png'),
              const SizedBox(width: 8),
              productHighlightData(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              productHighlightData(),
              const SizedBox(width: 8),
              productHighlightImages('assets/images/highlight-img2.png'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              productHighlightImages('assets/images/highlight-img3.png'),
              const SizedBox(width: 8),
              productHighlightData(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              productHighlightData(),
              const SizedBox(width: 8),
              productHighlightImages('assets/images/highlight-img1.png'),
            ],
          )
        ],
      ),
    );
  }
}

// Product Details Accordion
Widget accordianData(String text) {
  return Text(text);
}

Widget accordianElement(
    String title, bool isExpanded, Function() onTap, Widget content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFB0B0B0),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const Spacer(),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 14,
                weight: 700,
              ),
            ],
          ),
        ),
      ),
      if (isExpanded) content,
    ],
  );
}

class ProductDetailsAccordion extends StatefulWidget {
  const ProductDetailsAccordion({super.key});

  @override
  ProductDetailsAccordionState createState() => ProductDetailsAccordionState();
}

class ProductDetailsAccordionState extends State<ProductDetailsAccordion> {
  final List<bool> _isOpen = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          borderBottom(),
          accordianElement('Description', _isOpen[0], () {
            setState(() {
              _isOpen[0] = !_isOpen[0];
            });
          }, accordianData('Accordian data 1')),
          accordianElement('Additional Information', _isOpen[1], () {
            setState(() {
              _isOpen[1] = !_isOpen[1];
            });
          }, accordianData('Accordian data 2')),
          accordianElement('Shipping & Returns', _isOpen[2], () {
            setState(() {
              _isOpen[2] = !_isOpen[2];
            });
          }, accordianData('Accordian data 3')),
          accordianElement('Reviews', _isOpen[3], () {
            setState(() {
              _isOpen[3] = !_isOpen[3];
            });
          }, accordianData('Accordian data 4')),
        ],
      ),
    );
  }
}

//Product user manual
class ProductUserManual extends StatelessWidget {
  const ProductUserManual({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFFDADADA),
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Text(
              'Download User Manual',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Image.asset('assets/images/user-manual.png', height: 28),
          ],
        ),
      ),
    );
  }
}

// view similar product
class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const Text(
            'View Similar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
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
          const SizedBox(height: 10),
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


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductDetailsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // banner
            ProductDetailsBanner(),
    
            // payment and reward
            Payment(),
    
            // check Status
            CheckStatus(),
    
            // Warranty Icons
            WarrantyIcons(),
    
            //product heightlight
            ProductHighlight(),
    
            // Product Details Accordion
            ProductDetailsAccordion(),
    
            //Product user manual
            ProductUserManual(),
    
            // view similar product
            Products(),
    
          ],
        ),
      ),
    );
  }
}
