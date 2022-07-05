import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/order.dart';
import 'package:drohealth/screens/cart/add_to_cart_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/drug_model.dart';

class ProductDetails extends StatefulWidget {
  final Drug drug;

  const ProductDetails({Key? key, required this.drug})
      : super(key: key);

  @override
  State<ProductDetails> createState() =>
      _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _numberOfPack = 0;

  _buildSimilarProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 117.62,
            width: 155.93,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.drug.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.95),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.drug.drugName,
                  style: const TextStyle(
                    color: Color(0xff363636),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.02,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${widget.drug.drugType} . ${widget.drug.drugDose}mg',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.02,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '₦ ${widget.drug.drugPrice}',
                  style: const TextStyle(
                    color: Color(0xff363636),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.02,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xffF2F2F2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24),
                  height: 120,
                  width: 414,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color(0xff9F5DE2),
                  ),
                  child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons
                                        .arrow_back_ios_rounded,
                                    color: Colors.white,
                                  )),
                              const SizedBox(width: 5),
                              const Text(
                                'Pharmacy',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 1.5),
                              ),
                              const SizedBox(
                                width: 140.86,
                              ),
                              GestureDetector(
                                  onTap: () {
                                  },
                                  child: SvgPicture.asset(
                                      'assets/cart_dot.svg')),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 170,
                                width: 170,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                    // color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            widget.drug
                                                .imageUrl),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Center(
                              child: Text(
                                widget.drug.drugName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                '${widget.drug.drugType} . ${widget.drug.drugDose}mg',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets
                                          .symmetric(
                                      vertical: 31.0,
                                      horizontal: 25),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor:
                                                Colors
                                                    .green,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                            children: const [
                                              Text(
                                                'SOLD BY',
                                                style:
                                                    TextStyle(
                                                  fontSize:
                                                      10,
                                                  fontWeight:
                                                      FontWeight
                                                          .normal,
                                                  color: Color(
                                                      0xff8EA5BC),
                                                  letterSpacing:
                                                      2,
                                                ),
                                              ),
                                              Text(
                                                'Emzor Pharmaceuticals',
                                                style:
                                                    TextStyle(
                                                  fontWeight:
                                                      FontWeight
                                                          .bold,
                                                  fontSize:
                                                      14,
                                                  color: Color(
                                                      0xff13447A),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 82,
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius
                                            .circular(10),
                                    color: const Color(
                                            0xff9F5DE2)
                                        .withOpacity(0.1),
                                  ),
                                  child: const Icon(
                                    Icons
                                        .favorite_border_rounded,
                                    color:
                                        Color(0xff9F5DE2),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(
                                          left: 25.0),
                                  child: Container(
                                    height: 40,
                                    width: 96,
                                    padding:
                                        const EdgeInsets
                                            .all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                    0.4)),
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                                    10),
                                        color:
                                            Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (_numberOfPack >
                                                0) {
                                              _numberOfPack--;
                                              setState(
                                                  () {});
                                            }
                                          },
                                          child: const Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize:
                                                    20,
                                                fontWeight:
                                                    FontWeight
                                                        .w700),
                                          ),
                                        ),
                                        Text(
                                          '$_numberOfPack',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight:
                                                  FontWeight
                                                      .w700),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _numberOfPack++;
                                            setState(() {});
                                          },
                                          child: const Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize:
                                                    20,
                                                fontWeight:
                                                    FontWeight
                                                        .w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Pack(s)',
                                ),
                                const SizedBox(
                                  width: 66,
                                ),
                                const SizedBox(
                                  height: 14,
                                  width: 11,
                                  child: Text('₦'),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.drug.drugPrice
                                          .toStringAsFixed(
                                              0),
                                      style:
                                          const TextStyle(
                                              fontWeight:
                                                  FontWeight
                                                      .w700,
                                              fontSize: 32),
                                    ),
                                    const Text(
                                      '.00',
                                      style: TextStyle(
                                          fontWeight:
                                              FontWeight
                                                  .w700,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 34,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, bottom: 20),
                              child: Text(
                                'PRODUCT DETAILS',
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 4,
                                    color:
                                        Color(0xff8EA5BC),
                                    fontWeight:
                                        FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            //SizedBox(height: 20,),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(
                                          left: 25.0),
                                  child: Row(
                                    children: [
                                      buildProductDescription(
                                          imageUrl:
                                              'assets/drug.png',
                                          value:
                                              '8 x 12 tablets (96)',
                                          requirement:
                                              'PACK SIZE'),
                                      const SizedBox(
                                          width: 20),
                                      buildProductDescription(
                                          requirement:
                                              'PRODUCT ID',
                                          imageUrl:
                                              'assets/barcode.png',
                                          value:
                                              'PRO23648856'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(
                                          left: 25.0),
                                  child: Row(
                                    children: [
                                      buildProductDescription(
                                          imageUrl:
                                              'assets/drug2.png',
                                          value: widget.drug
                                              .drugName,
                                          requirement:
                                              'CONSTITUENTS'),
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      buildProductDescription(
                                          imageUrl:
                                              'assets/dispense.png',
                                          value: 'Packs',
                                          requirement:
                                              'DISPENSED IN'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(
                                      left: 25, top: 20),
                              child: Text(
                                '1 pack of ${widget.drug.drugName}(500mg) contains 8\n units of 12 tablets',
                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.w400,
                                  fontSize: 14,
                                  color:
                                      Color(0xff80000000),
                                ),
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 25),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Similar Products',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.w700,
                                  letterSpacing: 0.02,
                                  color: Color(0xff363636)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 190,
                          padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 15),
                          decoration: const BoxDecoration(
                              //color: Colors.green,
                              ),
                          child: ListView.builder(
                              scrollDirection:
                                  Axis.horizontal,
                              itemCount: drugs.length,
                              itemBuilder:
                                  (BuildContext context,
                                      int index) {
                                return _buildSimilarProduct(
                                    context);
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            25, 18, 25, 27),
                        child: GestureDetector(
                          onTap: () {
                            currentUser.addToCart(
                                widget.drug.drugName,
                                Order(
                                    drug: widget.drug,
                                    numberOfPacks:
                                        _numberOfPack));
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => CartSuccess(
                                  drugName:
                                      widget.drug.drugName),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 364,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color:
                                        Color(0xffAD3BFC),
                                    blurRadius: 2,
                                    offset: Offset(7, 0)),
                              ],
                              borderRadius:
                                  BorderRadius.circular(10),
                              gradient:
                                  const LinearGradient(
                                begin:
                                    Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xff7A08FA),
                                  Color(0xffAD3BFC),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets
                                      .symmetric(
                                  vertical: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: const [
                                  Icon(
                                    Icons
                                        .shopping_cart_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                          FontWeight.w700,
                                      letterSpacing: -0.02,
                                      color: Colors.white,
                                    ),
                                    textAlign:
                                        TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget buildProductDescription(
      {required String imageUrl,
      required String requirement,
      required String value}) {
    return Row(
      children: [
        const SizedBox(
          width: 9,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SizedBox(
            height: 28,
            width: 28,
            child: Image(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                requirement,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                  color: Color(0xff8EA5BC),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.02,
                  color: Color(0xff13447A),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
