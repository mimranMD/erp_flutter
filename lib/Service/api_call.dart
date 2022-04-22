import 'dart:convert';
import 'dart:developer';
import 'package:erp_flutter/Models/constants.dart';
import 'package:erp_flutter/Models/login_model.dart';
import 'package:http/http.dart' as http;

import '../Models/dashboardmodel.dart';

class ApiCalls {
  Future<LoginModel?> userLoginF(
    String companyId,
    String loginName,
    String password,
  ) async {
    Map userData = {
      'CompanyID': companyId,
      'LoginName': loginName,
      'Password': password,
      'UDID': "123",
      'Lang': "eng",
    };
    try {
      http.Response httpResponse = await http.post(
          Uri.parse(
              "https://alg001-mobile-bi-ws.webware.om:8881/HRSDashboard.asmx/LoginCheck"),
          body: userData);

      log("satusCode......${httpResponse.statusCode}");
      log("body......${httpResponse.body}");
      if (httpResponse.statusCode == 200) {
        userModel = LoginModel.fromJson(json.decode(httpResponse.body));

        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      log("error....... $e");
      return null;
    }
  }
  Future<List<DashboardMain>?> dashboard(
    String companyID,
    String typeID,
     int empNo,
     String lang,
     String divisionID
   
  ) async {
    
    try {
      http.Response httpResponse = await http.get(
          Uri.parse(
              "https://alg001-mobile-bi-ws.webware.om:8881/HRSDashboard.asmx/MasterData?CompanyID=$companyID&DivisionID=$divisionID&TypeID=$typeID&EmpNo=$empNo&lang=$lang"),
          );

      log("satusCode......${httpResponse.statusCode}");
      log("body......${httpResponse.body}");
      if (httpResponse.statusCode == 200) {
        final parsed = json.decode(httpResponse.body).cast<Map<String, dynamic>>();
      print(json.decode(httpResponse.body));
      return parsed.map<DashboardMain>((json) => DashboardMain.fromJson(json)).toList();
      } else {
        return null;
      }
    } catch (e) {
      log("error....... $e");
      return null;
    }
  }
  
}


