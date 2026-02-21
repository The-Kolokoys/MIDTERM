import 'package:flutter/cupertino.dart';
import '../models/cart_item.dart';
import '../models/menu_item.dart';

class CartStore extends ChangeNotifier {
  static CartStore? _instance;
  static CartStore get instance {
    _instance ??= CartStore._();
    return _instance!;
  }

  CartStore._();

  final List<CartItem> _items = [];
  String? restaurantName;

  List<CartItem> get items => _items;
  int get count => _items.fold(0, (sum, item) => sum + item.qty);
  double get total => _items.fold(0, (sum, item) => sum + (item.price * item.qty));

  void add(CartItem item, [String? fromRestaurant]) {
    if (_items.isEmpty && fromRestaurant != null) {
      restaurantName = fromRestaurant;
    }

    for (var cartItem in _items) {
      if (cartItem.id == item.id) {
        cartItem.qty++;
        notifyListeners();
        return;
      }
    }
    _items.add(item);
    notifyListeners();
  }

  void decrease(String id) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        if (_items[i].qty > 1) {
          _items[i].qty--;
        } else {
          _items.removeAt(i);
        }
        break;
      }
    }
    
    if (_items.isEmpty) {
      restaurantName = null;
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    restaurantName = null;
    notifyListeners();
  }
}
