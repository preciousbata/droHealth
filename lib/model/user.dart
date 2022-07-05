import 'package:drohealth/model/drug_model.dart';
import 'package:drohealth/model/order.dart';

class User {
  final Map<String, Order> cartItems;

  User(this.cartItems);

  User removeItem(String itemName) {
    if (cartItems.containsKey(itemName)) {
      cartItems.removeWhere((key, _) => key == itemName);
    }
    return User(cartItems);
  }

  User updateCart(String itemName, int numberOfPacks){
    if (cartItems.containsKey(itemName)) {
      Order order = cartItems[itemName]!;
      order.numberOfPacks = numberOfPacks;
      cartItems[itemName] = order;
    }
    return User(cartItems);
  }


  int get total {
    return cartItems.values
        .map((e) => e.drug.drugPrice * e.numberOfPacks)
        .fold(0, (a, b) => a.toInt() + b.toInt());
  }

  void addToCart(String name, Order order) {
    cartItems[name] = order;
  }

  Order getOrderByName(String key) {
    return cartItems[key] ??
        Order(
            drug: Drug(
                drugName: key,
                imageUrl: '',
                drugDose: '',
                drugPrice: 0,
                drugType: ''),
            numberOfPacks: 0);
  }

  @override
  String toString() {
    return 'User{cartItems: $cartItems}';
  }
}
