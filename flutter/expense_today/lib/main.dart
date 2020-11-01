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
  }

  void _updateCostForEachRow(int rowNum, double newVal) {
    setState(() {
      if (costForEachRow.length > rowNum) {
        costForEachRow[rowNum] = newVal;
      }

      double totalCost =
          costForEachRow.reduce((value, element) => value + element);

      print("Total Cost: ${totalCost}");
      if (totalCost > 0.0) {
        title = "${appTitle} | Total Cost: \$${totalCost}";
      } else {
        title = appTitle;
      }
    });
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
          addRow: _addRow,
          deleteLastRow: _deleteLastRow,
        ),
      ),
    );
  }
}

class FloatingButtonsWidget extends StatelessWidget {
  Function addRow;
  Function deleteLastRow;

  FloatingButtonsWidget({this.addRow, this.deleteLastRow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
