import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final double height;
  final double width;

  CustomAppBar(
      {Key? key,
      this.height = 120,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: height, //120,
      width: width, //414
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xff9F5DE2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                      Icons.arrow_back_ios_new_rounded),
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.5),
                ),
                const SizedBox(
                  width: 106,
                ),
                SvgPicture.asset('assets/cart.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
