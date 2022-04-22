// To parse this JSON data, do
//
//     final dashboardMain = dashboardMainFromJson(jsonString);

import 'dart:convert';

List<DashboardMain> dashboardMainFromJson(String str) => List<DashboardMain>.from(json.decode(str).map((x) => DashboardMain.fromJson(x)));

String dashboardMainToJson(List<DashboardMain> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashboardMain {
    DashboardMain({
        this.costcenterCode,
        this.costcenterName,
        this.moduleName,
        this.chartName,
        this.screenName,
    });

    String? costcenterCode;
    String? costcenterName;
    String? moduleName;
    String? chartName;
    String? screenName;

    factory DashboardMain.fromJson(Map<String, dynamic> json) => DashboardMain(
        costcenterCode: json["CostcenterCode"],
        costcenterName: json["CostcenterName"],
        moduleName: json["ModuleName"],
        chartName: json["ChartName"],
        screenName: json["ScreenName"],
    );

    Map<String, dynamic> toJson() => {
        "CostcenterCode": costcenterCode,
        "CostcenterName": costcenterName,
        "ModuleName": moduleName,
        "ChartName": chartName,
        "ScreenName": screenName,
    };
}
