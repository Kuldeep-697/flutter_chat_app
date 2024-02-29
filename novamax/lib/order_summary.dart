import 'package:flutter/material.dart';
import 'package:novamax/home_page.dart';
import 'package:novamax/product_details.dart';

Widget borderBottom() {
  return Container(
    height: 0.5,
    color: const Color(0xFFB0B0B0),
  );
}

// PurchasePowerAppBar
class OrderSummaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderSummaryAppBar({super.key});

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
        'Order Summary',
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

// Existing Address
class ExistingAddress extends StatelessWidget {
  const ExistingAddress({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: Radio(
            value: true,
            groupValue: isSelected,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
        ),
        const Expanded(
          child: Text(
            'Shop no. 59, PARWANA ROAD. RASHID MARKET. \nKRISHNA NAGAR. EAST DELHI. DELHI. 110051',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF514F4F)),
          ),
        ),
      ],
    );
  }
}

class OrderAddress extends StatefulWidget {
  const OrderAddress({super.key});

  @override
  State<OrderAddress> createState() => _OrderAddressState();
}

class _OrderAddressState extends State<OrderAddress> {
  bool _isExistingAddress = false;

  void _isExistingAddressChanged(bool? value) {
    setState(() {
      _isExistingAddress = value ?? !_isExistingAddress;
    });
  }

  Widget addressArea() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ExistingAddress(
            isSelected: _isExistingAddress,
            onChanged: _isExistingAddressChanged,
          ),
          const SizedBox(height: 15),
          borderBottom(),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Change Address   ',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF28B658)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF2F2F2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          addressArea(),
        ],
      ),
    );
  }
}

// Cart
Widget productTitle(String title, String price) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF514F4F)),
      ),
      const Spacer(),
      Text(
        price,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget productQuantity(String title, String quantity) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF514F4F)),
      ),
      const Spacer(),
      Text(
        quantity,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget productSubTotal(String title, String subTotal) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF514F4F)),
      ),
      const Spacer(),
      Text(
        subTotal,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget productStandartDelivery() {
  return const Row(
    children: [
      Text(
        'Standard Delivery',
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF514F4F)),
      ),
      Spacer(),
      Text(
        'Free',
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF28B658)),
      ),
    ],
  );
}

Widget productTotal(String total) {
  return Row(
    children: [
      const Text(
        'Total:',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF514F4F)),
      ),
      const Spacer(),
      Text(
        total,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

class DirectBankTransferMethod extends StatelessWidget {
  const DirectBankTransferMethod({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.9,
              child: Radio(
                value: true,
                groupValue: isSelected,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
            ),
            const Text(
              "Direct Bank Transfer",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CheckPaymentMethod extends StatelessWidget {
  const CheckPaymentMethod({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.9,
              child: Radio(
                value: true,
                groupValue: isSelected,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
            ),
            const Text(
              "Check Payment",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E1E),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}

class UpiTransferMethod extends StatelessWidget {
  const UpiTransferMethod({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.9,
              child: Radio(
                value: true,
                groupValue: isSelected,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
            ),
            const Text(
              "UPI Transfer",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CreditDebitCard extends StatelessWidget {
  const CreditDebitCard({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.9,
              child: Radio(
                value: true,
                groupValue: isSelected,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
            ),
            const Text(
              "Credit Card / Debit Card",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
        ),
        const Text(
          'Agree to all terms and conditions',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E1E1E),
          ),
        ),
      ],
    );
  }
}

class OrderCart extends StatefulWidget {
  const OrderCart({super.key});

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  bool _isDirectBankTransferSelected = false;
  bool _isCheckPaymentSelected = false;
  bool _isUpiTransferSelected = false;
  bool _isCreditDebitSelected = false;
  bool _agreeToTerms = false;

  void _onDirectBankTransferChanged(bool? value) {
    setState(() {
      _isDirectBankTransferSelected = value ?? false;
      _isCheckPaymentSelected = false;
      _isUpiTransferSelected = false;
      _isCreditDebitSelected = false;
    });
  }

  void _onCheckPaymentChanged(bool? value) {
    setState(() {
      _isCheckPaymentSelected = value ?? false;
      _isDirectBankTransferSelected = false;
      _isUpiTransferSelected = false;
      _isCreditDebitSelected = false;
    });
  }

  void _onUpiTransferChanged(bool? value) {
    setState(() {
      _isUpiTransferSelected = value ?? false;
      _isDirectBankTransferSelected = false;
      _isCheckPaymentSelected = false;
      _isCreditDebitSelected = false;
    });
  }

  void _onCreditSelectedChanged(bool? value) {
    setState(() {
      _isCreditDebitSelected = value ?? false;
      _isDirectBankTransferSelected = false;
      _isCheckPaymentSelected = false;
      _isUpiTransferSelected = false;
    });
  }

  void _onAgreeToTermsChanged(bool? value) {
    setState(() {
      _agreeToTerms = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFFF6F6F6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Cart Total',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 7),
        borderBottom(),
        const SizedBox(height: 15),
        productTitle(
            'Novamax Rambo Junior 75 L \nCommercial Air Cooler...', '₹82,960'),
        const SizedBox(height: 15),
        productQuantity('Quantity:', '6'),
        const SizedBox(height: 24),
        productSubTotal('Subtotal:', '₹82,960'),
        const SizedBox(height: 24),
        productStandartDelivery(),
        const SizedBox(height: 24),
        productTotal('₹82,960'),
        const SizedBox(height: 24),
        DirectBankTransferMethod(
          isSelected: _isDirectBankTransferSelected,
          onChanged: _onDirectBankTransferChanged,
        ),
        CheckPaymentMethod(
          isSelected: _isCheckPaymentSelected,
          onChanged: _onCheckPaymentChanged,
        ),
        UpiTransferMethod(
          isSelected: _isUpiTransferSelected,
          onChanged: _onUpiTransferChanged,
        ),
        CreditDebitCard(
          isSelected: _isCreditDebitSelected,
          onChanged: _onCreditSelectedChanged,
        ),
        TermsAndConditionsCheckbox(
          value: _agreeToTerms,
          onChanged: _onAgreeToTermsChanged,
        ),
      ]),
    );
  }
}

//Proceed To Pay Button
class ProceedToPayButton extends StatelessWidget {
  const ProceedToPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 66,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.15),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Proceed to pay'.toUpperCase(),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
    );
  }
}

// Order product
Widget orderProductImage(String imagePath) {
  return Image.asset(
    imagePath,
    width: 91,
    height: 88,
    fit: BoxFit.cover,
  );
}

Widget orderProductTitle(String title) {
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

Widget orderProductSubTitle(String title) {
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

Widget orderProductPricing(String pricing) {
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

Widget orderProductQuantity(String pricing) {
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

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key});

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
                orderProductImage('assets/images/product-img.png'),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderProductTitle(
                        'Novamax Rambo Junior 75 L Commercial Air Cooler...',
                      ),
                      const SizedBox(height: 4),
                      orderProductSubTitle(
                        '(Grey, Gloster 125 L Desert Air Cooler With Powerful Air Throw, Honeycomb Cooling)',
                      ),
                      const SizedBox(height: 4),
                      orderProductPricing('19,290'),
                      orderProductQuantity('Quantity 6'),
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

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OrderSummaryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            OrderAddress(),
            SizedBox(height: 10),
            OrderProduct(),
            SizedBox(height: 10),
            OrderProduct(),
            SizedBox(height: 10),
            OrderCart(),
          ]),
        ),
      ),
      bottomNavigationBar: ProceedToPayButton(),
    );
  }
}
