import 'package:flutter/material.dart';
import 'package:expense_today/category_widget.dart';

final String appTitle = "Expense App";

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = appTitle;
  int totalRow = 0;
  List<double> costForEachRow = [];

  void _addRow() {
    setState(() {
      totalRow += 1;
      costForEachRow.add(0);
    });
  }

  void _deleteLastRow() {
    setState(() {
      int newTotalRow = totalRow - 1;
      totalRow = newTotalRow < 0 ? 0 : newTotalRow;
      if (costForEachRow.isNotEmpty) {
        costForEachRow.removeLast();
      }
    });

    _updateTotalCost();
  }

  void _updateTotalCost() {
    setState(() {
      double totalCost = costForEachRow.length > 0
          ? costForEachRow.reduce((value, element) => value + element)
          : 0;

      if (totalCost > 0.0) {
        title = "${appTitle} | Total Cost: \$${totalCost}";
      } else {
        title = appTitle;
      }
    });
  }

  void _updateCostForEachRow(int rowNum, double newVal) {
    print("Row ${rowNum} - newVal ${newVal}");
    setState(() {
      if (costForEachRow.length > rowNum) {
        costForEachRow[rowNum] = newVal;
      }
    });

    _updateTotalCost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            for (int i = 0; i < totalRow; ++i)
              CategoryWidget(
                rowNumber: i,
                callback: _updateCostForEachRow,
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: Container(
        child: FloatingButtonsWidget(
          totalRow: this.totalRow,
          addRow: _addRow,
          deleteLastRow: _deleteLastRow,
        ),
      ),
    );
  }
}

class FloatingButtonsWidget extends StatelessWidget {
  int totalRow;
  Function addRow;
  Function deleteLastRow;

  FloatingButtonsWidget({this.totalRow, this.addRow, this.deleteLastRow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (totalRow > 0)
            FloatingActionButton.extended(
              onPressed: deleteLastRow,
              label: Text('Delete'),
              icon: Icon(Icons.remove),
              backgroundColor: Colors.pink,
            ),
          FloatingActionButton.extended(
            onPressed: addRow,
            label: Text('Add'),
            icon: Icon(Icons.add),
            backgroundColor: Colors.pink,
          )
        ],
      ),
    );
  }
}
