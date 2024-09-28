import 'package:teko_shop/data/models/item_model.dart';
import 'package:teko_shop/domain/repositories/item_repository.dart';

class AddItemUseCase {
  final ItemRepository _itemRepository;

  AddItemUseCase(this._itemRepository);

  Future<void> execute(ItemModel item) async {
    await _itemRepository.addItem(item);
  }
}
