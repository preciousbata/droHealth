import 'package:flutter/material.dart';

import '../model/drug_model.dart';

class SearchResult extends StatelessWidget {
  final Drug drug;

  const SearchResult({Key? key, required this.drug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffF2F2F2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 86,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(drug.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              drug.drugName,
              style: const TextStyle(
                letterSpacing: -0.02,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "${drug.drugType}.${drug.drugDose}mg",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.02,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  drug.drugPrice.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: -0.02,
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff9F5DE2).withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    color: Color(0xff9F5DE2),
                    size: 12,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 11, 10),
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xff9F5DE2))),
              child: const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 34),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9F5DE2),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
