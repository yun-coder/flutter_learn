import 'package:flutter/material.dart';
import 'package:my_app1/cart_provider/models/catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalogModel;

  final List<int> _itemIds = [];

  // get
  CatalogModel get catalog => _catalogModel;
  // set
  set catalog(CatalogModel catalogModel) {
    _catalogModel = catalogModel;
    notifyListeners();
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  int get totalPrice => items.fold(0, (prev, current) => prev + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
