import 'dart:convert';

LoginModel dashboardFromJson(String str) => LoginModel.fromJson(json.decode(str));

String dashboardToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.empNo,
        required this.status,
        required this.passwordOrg,
    });

    String empNo;
    String status;
    String passwordOrg;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        empNo: json["Emp_no"],
        status: json["Status"],
        passwordOrg: json["PasswordOrg"],
    );

    Map<String, dynamic> toJson() => {
        "Emp_no": empNo,
        "Status": status,
        "PasswordOrg": passwordOrg,
    };
}
