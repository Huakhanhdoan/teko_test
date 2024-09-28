import 'package:teko_shop/data/models/item_model.dart';

abstract class ItemRepository {
  ItemRepository();
  Future<List<ItemModel>?> getAllItem();
  Future<void> addItem(ItemModel item);
}
