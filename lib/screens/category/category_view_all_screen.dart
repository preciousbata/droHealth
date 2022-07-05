import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() =>
      _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Widget buildCategories(Category category) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, '/categorydetail',
            arguments: category),
        child: Container(
          // height: 110,
          // width: 170,
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   Color(0x8F000000)
            // ]),
            image: DecorationImage(
              image: AssetImage(category.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.95),
          ),
          child: Center(
              child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: -0.02,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
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
                    padding:
                        const EdgeInsets.only(top: 36.0),
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
                        SvgPicture.asset(
                            'assets/truck.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: category.length,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder:
                    (BuildContext context, int index) {
                  return buildCategories(category[index]);
                },
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 125),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
