import 'package:dio/dio.dart';

final _dio = Dio();

class CartRepository {

  Future<Response> addItemToCart(int id) async {
    final response = await _dio.post(
      'https://student.valuxapps.com/api/carts',
      data: {
        'product_id': id,
      }
    );
    return response;
  }
}
