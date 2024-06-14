import 'package:dio/dio.dart';
import 'package:ecommerce_trining/models/categories_product_model.dart';



class CategoriesProductRepository {


  Future<CategoriesProductModel> getCatProductData(String id) async {
    final response = await Dio().get(
        'https://student.valuxapps.com/api/products?category_id=$id');
    final catProductData = CategoriesProductModel.fromJson(response.data);
    return catProductData;
  }

}
