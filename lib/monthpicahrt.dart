// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class StipendChartSyncfusion extends StatefulWidget {
  const StipendChartSyncfusion({super.key});

  @override
  State<StipendChartSyncfusion> createState() => _StipendChartSyncfusionState();
}

class _StipendChartSyncfusionState extends State<StipendChartSyncfusion> {
  List<_ChartData> chartMonthData = [];
  bool isLoading = true;
  String? errorMessage;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    fetchmonthData();
  }

  String getMonthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return (month >= 1 && month <= 12) ? months[month] : 'Unknown';
  }

  Future<void> fetchmonthData() async {
    try {
      final url = Uri.parse('http://localhost:8081/stipend');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        Map<int, double> monthTotals = {};

        for (var item in data) {
          int month = int.tryParse(item['stipendMonth'] ?? '0') ?? 0;
          double amount = double.tryParse(item['amount'] ?? '0') ?? 0.0;

          if (month > 0) {
            monthTotals.update(month, (value) => value + amount,
                ifAbsent: () => amount);
          }
        }

        setState(() {
          chartMonthData = monthTotals.entries
              .map((e) => _ChartData(getMonthName(e.key), e.value))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load stipend data');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Widget _pieChart({
    required String title,
    required List<_ChartData> chartData,
  }) {
    double totalCount = chartData.fold(0, (sum, data) => sum + data.y);

    return SizedBox(
      width: 400,
      child: SfCircularChart(
        title: ChartTitle(
          text: title,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <PieSeries<_ChartData, String>>[
          PieSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            explode: true,
            explodeIndex: selectedIndex ?? -1,
            radius: '90%',
            dataLabelMapper: (_ChartData data, _) {
              if (data.y == 0) return '';
              final percentage = (data.y / totalCount * 100).toStringAsFixed(1);
              return '${data.x}\n$percentage%';
            },
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
              connectorLineSettings: ConnectorLineSettings(width: 0),
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPointTap: (ChartPointDetails details) {
              setState(() {
                selectedIndex = details.pointIndex!;
              });
            },
            strokeColor: Colors.white,
            strokeWidth: 2,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stipend by Month")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : chartMonthData.isEmpty
                  ? const Center(child: Text("No data available."))
                  : Center(
                      child: _pieChart(
                        title: "Monthly Stipend",
                        chartData: chartMonthData,
                      ),
                    ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  _ChartData(this.x, this.y);
}
