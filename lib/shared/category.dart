import 'package:flutter/material.dart';
import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/category_model.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  _buildCategories(
      BuildContext context, Category categories) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 98.55,
            width: 125.93,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(categories.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.95),
            ),
          ),
          Container(
            height: 98.55,
            width: 125.93,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.93),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.56),
                    Colors.black54.withOpacity(0.56),
                    Colors.black.withOpacity(0.56),
                  ]),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Text(
              categories.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.45,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.02,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CATEGORIES',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: const Color(0xff363636)
                        .withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/viewall');
                  },
                  child: const Text(
                    'VIEW ALL',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 14,
                      color: Color(0xff9F5DE2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15, left: 5, bottom: 4),
            child: Container(
              height: 98.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.95),
              ),
              child: ListView.builder(
                  padding:
                      const EdgeInsets.only(right: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder:
                      (BuildContext context, int index) {
                    Category categories = category[index];
                    return _buildCategories(
                        context, categories);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
