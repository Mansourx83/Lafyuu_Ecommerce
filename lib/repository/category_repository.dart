import 'package:dio/dio.dart';
import 'package:ecommerce_trining/models/category_model.dart';



class CategoriesRepository {


  Future<CategoryModel> getCategoriesData() async {
    final response = await Dio().get(
        'https://student.valuxapps.com/api/categories');
    final categoryData = CategoryModel.fromJson(response.data);
    return categoryData;
  }

}
