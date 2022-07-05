import 'package:flutter/material.dart';
import 'package:drohealth/model/drug_model.dart';

class Suggestions extends StatefulWidget {
  final List<Drug> drugs;
  final Function(Drug drug)? onSuggestionClicked;

  const Suggestions({
    Key? key,
    required this.drugs,
    this.onSuggestionClicked,
  }) : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {


  _buildSuggestion(Drug drug) {
    return GestureDetector(
      onTap: () {
        if(widget.onSuggestionClicked != null){
          widget.onSuggestionClicked!(drug);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 127,
              width: 168,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(drug.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.95),
                  topLeft: Radius.circular(10.95),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drug.drugName,
                    style: const TextStyle(
                      color: Color(0xff363636),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.02,
                    ),
                  ),
                  Text(
                    '${drug.drugType} . ${drug.drugDose}mg',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.02,
                    ),
                  ),
                  Text(
                    '₦ ${drug.drugPrice}',
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: widget.drugs.length,
      itemBuilder: (_, int index) {
        return _buildSuggestion(widget.drugs[index]);
      },
    );
  }
}
