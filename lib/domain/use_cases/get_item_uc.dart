import 'package:teko_shop/data/models/item_model.dart';
import 'package:teko_shop/domain/repositories/item_repository.dart';

class GetItemUseCase {
  final ItemRepository _itemRepository;

  GetItemUseCase(this._itemRepository);

  Future<List<ItemModel>?> execute() async {
    return await _itemRepository.getAllItem();
  }
}
