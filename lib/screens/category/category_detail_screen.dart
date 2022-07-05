import 'package:drohealth/data/data.dart';
import 'package:drohealth/model/category_model.dart';
import 'package:drohealth/shared/appbar.dart';
import 'package:drohealth/shared/category.dart';
import 'package:drohealth/shared/suggestions.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;
  const CategoryDetailScreen(
      {Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState
    extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Categories(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Text(
                      widget.category.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff363636)
                            .withOpacity(0.4),
                      ),
                    ),
                  ),
                  Suggestions(drugs: drugs)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
