import 'package:drohealth/model/drug_model.dart';
import '../model/category_model.dart';
import '../model/order.dart';
import '../model/user.dart';

List<Category> category = [
  Category(name: 'Headache', imageUrl: "assets/headache.jpg"),
  Category(name: 'Supplement', imageUrl: 'assets/supplement.jpg'),
  Category(name: 'Infant', imageUrl: 'assets/infant.jpg'),
  Category(name: 'Cough', imageUrl: 'assets/coughing.jpg'),
];

//Drugs
final paracetamol = Drug(
    imageUrl: 'assets/paracetamol.jpg',
    drugDose: '800',
    drugName: 'Paracetamol',
    drugPrice: 350,
    drugType: 'Tablet');
final doliprane = Drug(
    imageUrl: 'assets/doliprane.jpg',
    drugDose: '1000',
    drugName: 'Doliprane',
    drugPrice: 350,
    drugType: 'Capsule');
final paracetamol2 = Drug(
    imageUrl: 'assets/paracetamol2.jpg',
    drugDose: '500',
    drugName: 'Paracetamol',
    drugPrice: 350,
    drugType: 'Tablet');
final ibuprofen = Drug(
    imageUrl: 'assets/ibuprofen.jpg',
    drugDose: '200',
    drugName: 'Ibuprofen',
    drugPrice: 350,
    drugType: 'Tablet');
final paracetamol3 = Drug(
    imageUrl: 'assets/paracetamol3.jpg',
    drugDose: '500',
    drugName: 'Paracetamol',
    drugPrice: 350,
    drugType: 'Tablet');
final ibuprofen2 = Drug(
    imageUrl: 'assets/ibuprofen2.jpg',
    drugDose: '400',
    drugName: 'Ibuprofen',
    drugPrice: 350,
    drugType: 'Tablet');

// suggestions
final List<Drug> drugs = [
  paracetamol,
  doliprane,
  paracetamol2,
  ibuprofen,
  paracetamol3,
  ibuprofen2,
];

//User
final currentUser = User({});
