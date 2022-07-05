import 'drug_model.dart';

class Order {
  final Drug drug;
  int numberOfPacks;

  Order({
    required this.drug,
    required this.numberOfPacks,
  });
}
