import 'package:dio/dio.dart';
import 'package:ecommerce_trining/models/flashsale_and_banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeRepository {


  Future<FlashSaleAndBannersModel> getBannersData() async {
    Response response = await Dio().get(
        'https://student.valuxapps.com/api/home');
    final bannerData = FlashSaleAndBannersModel.fromJson(response.data);
    return bannerData;
  }

  Future<FlashSaleAndBannersModel> getFlashSaleData() async {
    final response = await Dio().get(
        'https://student.valuxapps.com/api/home');
    final flashsaleData = FlashSaleAndBannersModel.fromJson(response.data);
    return flashsaleData;
  }
}