import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/drug_model.dart';
import 'package:drohealth/shared/category.dart';
import 'package:drohealth/shared/searchResult.dart';
import 'package:drohealth/shared/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() =>
      _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  List<Drug> _searchResults = [];
  bool _isPerformingSearch = false;
  final _textController = TextEditingController();

  void _performSearch(String value) {
    if (value.isNotEmpty && value.length >= 3) {
      _isPerformingSearch = true;
      _searchResults = drugs
          .where((drug) => drug.drugName
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    } else {
      _searchResults.clear();
      _isPerformingSearch = false;
    }
    setState(() {});
  }

  Widget _searchResult() {
    final size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;

    return Expanded(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 27,
          childAspectRatio: (itemWidth / 265),
          // 265 represents the supposed height of the container
          crossAxisSpacing: 15.0,
        ),
        shrinkWrap: true,
        padding: const EdgeInsets.only(
            top: 20.0, left: 16.0, right: 16.0),
        itemCount: _searchResults.length,
        itemBuilder: (_, int index) {
          return SearchResult(drug: _searchResults[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0),
              width: double.infinity,
              height: 160.0,
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
                    padding:
                        const EdgeInsets.only(top: 66.0),
                    child: Row(
                      children: [
                        const Text(
                          'Pharmacy',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 1.5),
                        ),
                        const SizedBox(
                          width: 200.86,
                        ),
                        SvgPicture.asset(
                            'assets/truck_dot.svg')
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _textController,
                        onChanged: _performSearch,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 7),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isPerformingSearch) ...[
              if (_searchResults.isNotEmpty)
                _searchResult()
              else
                Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/not_found.svg'),
                      Text(
                          'No result found for “${_textController.text.trim()}”')
                    ],
                  ),
                )
            ] else
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xffF2F2F2),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 25),
                          child: Row(
                            children: const [
                              Icon(Icons
                                  .location_on_outlined),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Delivery in',
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: 0.8),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Lagos, NG',
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.w600,
                                    fontSize: 14,
                                    letterSpacing: 0.8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Categories(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0,
                            left: 25.0,
                            bottom: 10.0),
                        child: Text(
                          'SUGGESTIONS',
                          style: TextStyle(
                            letterSpacing: 2,
                            color: const Color(0xff363636)
                                .withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15.0),
                        child: Suggestions(
                          drugs: drugs,
                          onSuggestionClicked: (drug) {
                            Navigator.pushNamed(
                                context, '/productDetail',
                                arguments: drug);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, '/checkout'),
        child: Container(
          height: 43,
          width: 153,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffFE806F),
                Color(0xffE5366A),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                const Text(
                  'Check Out',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: -0.02,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/cart.svg'),
                //CircleAvatar(child: Text(cartLength.cart.length.toString()),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
