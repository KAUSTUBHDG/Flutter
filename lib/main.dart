import 'package:flutter/material.dart';
import 'transactionList.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(2),
          children: <Widget>[
            
            DrawerHeader(
              child:Text('Options'),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),

            ListTile(
              title: Text('List'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              title: Text('Graph'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              title: Text('Date'),
              onTap: () {
                 Navigator.of(context).pop();
              },
            ),

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
      appBar: AppBar(
        title: Text("Expense"),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: 'Title',
                  labelText: 'Title',
                ),
              ),

              // TextFormField(
              //       decoration:  InputDecoration(
              //         icon:  Icon(Icons.person),
              //         hintText: 'Enter your name',
              //         labelText: 'Name',
              //       ),
              //     ),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'From',
                  labelText: 'From',
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'To',
                  labelText: 'To',
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Enter today\'s date',
                ),
                keyboardType: TextInputType.datetime,
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  hintText: 'Cost',
                  labelText: 'Cost',
                ),
              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  TransactionList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
