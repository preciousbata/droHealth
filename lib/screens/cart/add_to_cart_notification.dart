import 'package:flutter/material.dart';

class CartSuccess extends StatelessWidget {
  final String drugName;
  const CartSuccess({Key? key, required this.drugName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight:  Radius.circular(30.0),
          topLeft: Radius.circular(10.0),
        )
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 280,
      child: Column(
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Text('$drugName has been successfully\nadded to cart!!',style: const TextStyle(
              fontSize: 20,
              letterSpacing: -0.02,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 5),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/checkout');
              },
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xff7A08FA),
                      Color(0xffAD3BFC),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'View Cart',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.02,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 27),
            child: GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0x0f9f5de2)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.0),
                  child: Text(
                    'Continue Shoppping',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.02,
                      color: Color(0x0f9f5de2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
