import 'package:flutter/material.dart';
import 'package:Expense/transactionList.dart';
import 'transaction.dart';
import './new_transaction.dart';
import './transactionList.dart';
import './routes.dart';
//import 'dbHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<String, WidgetBuilder> getRouteList() {
    return {
      RouteList.transactionList: (context) => TransactionList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transactions> userTransactions = [];

  void addNewTransaction(
    String txtitle,
    String txfrom,
    String txto,
    double txcost,
    DateTime txdateTime,
  ) {
    final newTx = Transactions(
        title: txtitle,
        from: txfrom,
        to: txto,
        cost: txcost,
        id: DateTime.now().toString(),
        dateTime: txdateTime);

    setState(
      () {
        userTransactions.add(newTx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expense"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(2),
            children: <Widget>[
              DrawerHeader(
                child: Text("Options"),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text("Home"),
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteList.initial,
                ),
              ),
              ListTile(
                title: Text("Add Transaction"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NewTransaction(
                        addNewTransaction: addNewTransaction,
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                title: Text("List"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return TransactionList(
                          transaction: userTransactions,
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Graph"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              // ListTile(
              //   title: Text('Date'),
              //   onTap: () {

              //     Navigator.of(context).pop();
              //   },
              // ),
              ListTile(
                title: Text("Calculator"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Alert"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            "Welcome",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}

// https://medium.com/@abdulmuaz_ssp/bloc-local-global-state-management-with-flutter-e8e443b135f8
//https://bloclibrary.dev/#/

/*

import 'package:flutter/material.dart';
import 'transaction.dart';
import 'dbHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialKart - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  List<Transactions> transactions = [];
  List<Transactions> transactionsByName = [];


  TextEditingController titleController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();

  
  
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController titleUpdateController = TextEditingController();
  TextEditingController fromUpdateController = TextEditingController();
  TextEditingController toUpdateController = TextEditingController();
  TextEditingController costUpdateController = TextEditingController();
  TextEditingController dateTimeUpdateController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: ListView(
        children: <Widget>[
          Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Insert",
                  ),
                  Tab(
                    text: "View",
                  ),
                  Tab(
                    text: "Query",
                  ),
                  Tab(
                    text: "Update",
                  ),
                  Tab(
                    text: "Delete",
                  ),
                ],
              ),
              title: Text('TutorialKart - Flutter SQLite Tutorial'),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: fromController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'From',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: toController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'To',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: costController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cost',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: dateTimeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'dateTime',
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text('Insert Expense Details'),
                        onPressed: () {
                          String title = titleController.text;
                          String from = titleController.text;
                          String to = titleController.text;
                          DateTime dateTime =
                              DateTime.parse(dateTimeController.text);
                          double cost = double.parse(costController.text);
                          _insert(title, from, to, dateTime, cost);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: transactions.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == transactions.length) {
                        return RaisedButton(
                          child: Text('Refresh'),
                          onPressed: () {
                            setState(() {
                              _queryAll();
                            });
                          },
                        );
                      }
                      return Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            '[${transactions[index].title}]  ${transactions[index].from} ${transactions[index].to}  ${transactions[index].cost}  ${transactions[index].dateTime}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: queryController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                          onChanged: (text) {
                            if (text.length >= 2) {
                              setState(() {
                                _query(text);
                              });
                            } else {
                              setState(() {
                                transactionsByName.clear();
                              });
                            }
                          },
                        ),
                        height: 100,
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: transactionsByName.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              margin: EdgeInsets.all(2),
                              child: Center(
                                child: Text(
                                  '[${transactionsByName[index].title}]  ${transactionsByName[index].from} ${transactionsByName[index].to}  ${transactionsByName[index].cost}  ${transactionsByName[index].dateTime}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: idUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Id',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: titleUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: fromUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'From',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: toUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'To',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: costUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cost',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: dateTimeUpdateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text('Update Expense Details'),
                        onPressed: () {
                          int id = int.parse(idUpdateController.text);
                          String title = titleUpdateController.text;
                          String from = titleUpdateController.text;
                          String to = titleUpdateController.text;
                          DateTime dateTime =
                              DateTime.parse(dateTimeUpdateController.text);
                          double cost = double.parse(costUpdateController.text);
                          _update(id, title, from, to, dateTime, cost);
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          controller: idDeleteController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Id',
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text('Delete'),
                        onPressed: () {
                          int id = int.parse(idDeleteController.text);
                          _delete(id);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _insert(title, from, to, dateTime, cost) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnFrom: from,
      DatabaseHelper.columnTo: to,
      DatabaseHelper.columnCost: cost,
      DatabaseHelper.columnDateTime: dateTime,
      //    DatabaseHelper.columnId: id,
    };
    Transactions transactions = Transactions.fromMap(row);
    final id = await dbHelper.insert(transactions);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    transactions.clear();
    allRows.forEach((row) => transactions.add(Transactions.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    transactionsByName.clear();
    allRows.forEach((row) => transactionsByName.add(Transactions.fromMap(row)));
  }

  void _update(id, title, from, to, dateTime, cost) async {
    // row to update
    Transactions transactions = Transactions();
    final rowsAffected = await dbHelper.update(transactions);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }
}*/
