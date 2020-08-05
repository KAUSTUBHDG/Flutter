import 'package:flutter/material.dart';
//import 'package:sExpense/transactionList.dart';
// import 'package:flutter/services.dart';
import 'transaction.dart';
import 'new_transaction.dart';
//import 'transactionList.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
   List<Transaction> userTransactions = [];

  

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
                child: Text('Options'),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('List'),
                onTap: () {
                  // setState(() {
                  //   TransactionList();
                  // });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Graph'),
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
                title: Text('Calculator'),
                onTap: () {

                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Alert'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: NewTransaction(),
      ),
    );
  }
}
