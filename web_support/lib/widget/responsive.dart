import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key, 
    required this.mobile,
    required this.tablet, 
    required this.desktop, 
  });

  final Widget  mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;
  }


  static bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width >= 1200; 
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size size = MediaQuery.of(context).size;

        
        if (constraints.maxWidth >= 1080) {
          return desktop;
        } 
        else if (constraints.maxWidth >= 700 && tablet != null) {
          return tablet!;
        } 
        else {
          return mobile;
        }
      }
    ); 
  }
}