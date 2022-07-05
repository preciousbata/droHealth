import 'package:drohealth/model/user.dart';
import 'package:drohealth/shared/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/order.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/order.dart';
import '../../model/order.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  User _user = currentUser;

  _buildCartItem(Order? order) {
    var qty = order?.numberOfPacks;
    var price = order?.drug.drugPrice;
    var list = [for (var i = 1; i <= qty!; i++) i];
    var result = qty * price!;
    if (order == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(order.drug.imageUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.drug.drugName,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.02),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${order.drug.drugType} . ${order.drug.drugDose}mg',
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffBDBDBD),
                              letterSpacing: -0.02),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 9.0,
                        ),
                        Text(
                          '₦$result',
                          style: const TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                        child: CustomDropdownMenu(
                      defaultValue: order.numberOfPacks,
                      values: list,
                      onItemSelected: (int value) {
                        setState(() {
                          _user = _user.updateCart(order.drug.drugName, value);
                        });
                      },
                    )),
                    // DropdownButton(
                    //   value: selectedItem,
                    //   items: <String>[list.toString()].map((String item) {
                    //     return DropdownMenuItem(
                    //       value: item,
                    //       child: Text(item),
                    //     );
                    //   }).toList(),
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       selectedItem = newValue as int?;
                    //     });
                    //   },
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(19.0),
                    //   child: Container(
                    //     width: 58,
                    //     height: 31,
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //           BorderRadius.circular(10.0),
                    //       border: Border.all(
                    //         width: 0.8,
                    //         color: Colors.black54,
                    //       ),
                    //     ),
                    //     child: Padding(
                    //       padding:
                    //           const EdgeInsets.symmetric(
                    //               horizontal: 4.0),
                    //       child: Row(
                    //           mainAxisAlignment:
                    //               MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               order.numberOfPacks
                    //                   .toString(),
                    //               style: const TextStyle(
                    //                   fontSize: 14,
                    //                   fontWeight:
                    //                       FontWeight.w600,
                    //                   letterSpacing: 0.02),
                    //             ),
                    //             const SizedBox(
                    //               width: 6.2,
                    //             ),
                    //             GestureDetector(
                    //                 onTap: () {},
                    //                 child: const Icon(Icons
                    //                     .keyboard_arrow_down_rounded)),
                    //           ]),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        _user = _user.removeItem(order.drug.drugName);
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/bin.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Remove',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff9F5DE2)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 120,
            width: 414,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xff9F5DE2),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 33.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Cart',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _user.cartItems.keys.toList().length,
              itemBuilder: (_, int index) {
                final keys = _user.cartItems.keys.toList();
                final Order? order = _user.cartItems[keys[index]];
                return _buildCartItem(order);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(height: 1.0, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.02),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      '₦${_user.total.toString()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 207,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color(0xff7A08FA),
                        Color(0xffAD3BFC),
                      ])),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 60),
                    child: Text('CHECKOUT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
