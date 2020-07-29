import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text("No Data Added"),
              ],
            )
          : ListView.builder(itemBuilder: null),
    );
  }
}
