import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:teko_shop/data/models/item_model.dart';

class ItemService {
  final Dio _dio;

  ItemService(this._dio);

  Future<List<ItemModel>?> fetchData() async {
    try {
      final response = await _dio
          .get('https://hiring-test.stag.tekoapis.net/api/products/management');
      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        List<ItemModel> productList = [];
        for (var item in jsonResponse['data']) {
          if (item['type'] == 'ProductList') {
            var productItems = item['customAttributes']['productlist']['items'];

            productList = List<ItemModel>.from(
              productItems
                  .map((productJson) => ItemModel.fromJson(productJson)),
            );
          }
        }

        return productList;
      }
    } catch (e) {
      print('Lỗi: $e');
    }
    return null;
  }
}
