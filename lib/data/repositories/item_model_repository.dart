import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../util/constants.dart';
import '../model/item_model.dart';
import '../remote/dio_client.dart';

// abstract class ItemRepository {
//   Future<Either<ApiFailure, HistoriesDto>> getHistory({required String status});
// }

class ItemRepository {
  final DioClient dio = DioClient();

  Future<Either<String, List<ItemModel>?>> getItemByTypeId() async {
    String uri = '$baseUrl/general/get_item_by_type_v3?type_id=4&limit_amount=0';
    try {
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        log('${response.data}');
        final result = itemModelFromJson(response.data);
        return right(result);
      } else {
        debugPrint('error ${response.statusCode}');
        return left('error ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('error $e');
      return left('error $e');
    }
  }
}
