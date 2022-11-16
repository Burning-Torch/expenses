import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import './bar.dart';
import '../../model/expense.dart';

class Chart extends StatelessWidget {
  final double appBarHeight;
  final List<ExpenseModel> recentExpenses;

  const Chart({
    super.key,
    required this.appBarHeight,
    required this.recentExpenses,
  });

  double getTotalSpending(List<BarData> barData) {
    if (barData.isEmpty) {
      return 0;
    } else {
      var maxValue = 1.2 * barData.map((e) => e.amount).reduce(max);
      return maxValue;
    }
  }

  List<BarData> _getBarData() {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      var label = DateFormat.E().format(weekDay).substring(0, 1);
      double totalSpent = 0.0;
      for (var expense in recentExpenses) {
        if (expense.date.day == weekDay.day &&
            expense.date.month == weekDay.month &&
            expense.date.year == weekDay.year) {
          totalSpent += expense.price;
        }
      }
      return BarData(
        label: label,
        amount: totalSpent,
        percent: 0,
      );
    }).reversed.toList();
  }

  List<BarData> getBarData() {
    var barData = _getBarData();
    var totalSpending = getTotalSpending(barData);
    return barData.map((data) {
      if (totalSpending != 0) {
        data.percent = data.amount / totalSpending;
      }
      return data;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    statusBarHeight = statusBarHeight == 0 ? 25 : statusBarHeight;
    var bodyHeight = height - appBarHeight - statusBarHeight;
    return SizedBox(
      width: double.infinity,
      height: height < 500 ? 0.4 * bodyHeight : 0.25 * bodyHeight,
      child: Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bars(
                data: getBarData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartStack extends StatefulWidget {
  final double appBarHeight;
  final List<ExpenseModel> recentExpenses;

  const ChartStack({
    super.key,
    required this.appBarHeight,
    required this.recentExpenses,
  });

  @override
  State<StatefulWidget> createState() {
    return ChartStackState();
  }
}

class ChartStackState extends State<ChartStack> {
  bool showChart = true;

  void toggleShowChart(bool state) {
    setState(() {
      showChart = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    var inPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    debugPrint('inPortrait: $inPortrait');
    return Stack(
      children: [
        showChart == true || inPortrait
            ? Chart(
                appBarHeight: widget.appBarHeight,
                recentExpenses: widget.recentExpenses,
              )
            : Container(),
        inPortrait
            ? Container()
            : Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Show Chart',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Switch(
                      value: showChart,
                      onChanged: toggleShowChart,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
