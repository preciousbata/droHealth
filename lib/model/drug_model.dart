class Drug {
  final String imageUrl;
  final int drugPrice;
  final String drugName;
  final String drugType;
  final String drugDose;

  Drug({
    required this.imageUrl,
    required this.drugDose,
    required this.drugName,
    required this.drugPrice,
    required this.drugType,
  });

  @override
  String toString() {
    return 'Drug{imageUrl: $imageUrl, drugPrice: $drugPrice, drugName: $drugName, drugType: $drugType, drugDose: $drugDose}';
  }
}
