import 'dart:convert';

import 'package:teko_shop/data/data_source/remote/item_service.dart';
import 'package:teko_shop/data/models/item_model.dart';
import 'package:teko_shop/domain/repositories/item_repository.dart';

class ItemRepositoryImpl extends ItemRepository {
  final ItemService _itemDataSource;

  ItemRepositoryImpl(this._itemDataSource);

  @override
  Future<void> addItem(ItemModel item) async {
    Future.delayed(const Duration(seconds: 0));
    return;
  }

  @override
  Future<List<ItemModel>?> getAllItem() async {
    final result = await _itemDataSource.fetchData();
    return result;
  }
}
