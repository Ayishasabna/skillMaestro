import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/model/expert_sign_in_resp_model.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/expert_sign_in_req_model.dart';

class ExpertSignInApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<ExpertSignInResModel?> ExpertSignIn(
      ExpertSignInReqModel expertSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertSignIn;

    try {
      String mobi = expertSignInReqModel.mobile;
      log(("+++++++++++++$mobi"));
      log(("+++++++++++++${expertSignInReqModel.password}"));
      String? token = await getExpertAccesToken();
      Response response = await dio.post(path,
          data: jsonEncode(expertSignInReqModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));
      //log("==========+++++++++==============${response.data}");
      /* if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      } */
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ExpertSignInResModel responseData =
            ExpertSignInResModel.fromJson(response.data);
        log("============expert responsedata controller=======${responseData}");
        return responseData;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    /* try {
      Response response =
          await dio.post(path, data: jsonEncode(expertSignInReqModel.toJson()));
      log("===============================");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('=====responsedata expert========${response.data}');
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
       
        final token = response.data['experttoken'];
        //final data = response.data['data']['user'];
        //final id = data['_id'];
        //final name = data['username'];
        await storage.write(key: 'expert_access_token', value: token);
        //await storage.write(key: 'currentExpertName', value: name);

        //await storage.write(key: 'currentExpertId', value: id);
        return response.data;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).userNotExist(context);
      log(e.message.toString(), name: 'error');
    } */
    return null;
  }
}