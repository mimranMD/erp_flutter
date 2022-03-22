import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class PopulationData {
  int year;
  int population;
  charts.Color barColor;
  PopulationData({
    required this.year, 
    required this.population,
    required this.barColor
  });
}
final List<PopulationData> data = [
    PopulationData(
      year: 1880,
      population: 50189209,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
    ),
    PopulationData(
      year: 1890,
      population: 62979766,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
    ),
    PopulationData(
      year: 1900,
      population: 76212168,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
    ),
    PopulationData(
      year: 1910,
      population: 92228496,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
    ),
    PopulationData(
      year: 1920,
      population: 106021537,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
    PopulationData(
      year: 1930,
      population: 123202624,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
    ),
   
    PopulationData(
      year: 1990,
      population: 248709873,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)
    ),
  
    
  ];