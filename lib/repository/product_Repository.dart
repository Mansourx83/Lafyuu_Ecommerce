import 'package:dio/dio.dart';
import 'package:ecommerce_trining/models/categories_product_model.dart';
import 'package:ecommerce_trining/models/flashsale_and_banner_model.dart';
import 'package:ecommerce_trining/models/product_info_model.dart';

class ProductRepository {


  Future<FlashSaleAndBannersModel> getProductData() async {
    Response response = await Dio().get(
        'https://student.valuxapps.com/api/home');
    final ProductData = FlashSaleAndBannersModel.fromJson(response.data);
    return ProductData;
  }



  Future<ProductInfoModel> getProductItemInfo(int id) async {
    Response response = await Dio().get(
        'https://student.valuxapps.com/api/products/$id');
    final ProductItemOnfoData = ProductInfoModel.fromJson(response.data);
    return ProductItemOnfoData;
  }

}