import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;

  TransactionList({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionList'),
      ),
      body: Container(
        child: transaction == null || transaction.isEmpty
            ? Center(
                child: Text(
                  "No Data Added",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: transaction.length.compareTo(0),
                itemBuilder: (ctx, index) {
                  return SingleChildScrollView(
                    child: Center(
                      //  child: Card(
                      //     elevation: 5,
                      //     margin: EdgeInsets.symmetric(
                      //       vertical: 20,
                      //       horizontal: 20,
                      //     ),
                          child: Expanded(
                              child: ListTile(
                              leading:/* Card(
                                 // radius: 30,
                                 child:*/ Container(
                                   height: 50,
                                   child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: FittedBox(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '${transaction[index].title}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 50.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${transaction[index].from}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 50.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${transaction[index].to}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 50.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${transaction[index].cost}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 50.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          //    Text(
                                          // '${transaction[index].dateTime}',
                                          //   ),
                                          Text(
                                            DateFormat.yMMMd().format(
                                                transaction[index].dateTime),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          ),
                    
                  );
                },
              ),
      ),
    );
  }
}
