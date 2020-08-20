import 'package:flutter/material.dart';
import 'package:Expense/transaction.dart';
import 'package:intl/intl.dart';

//import 'transactionList.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key key, this.addNewTransaction}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final from = TextEditingController();
  final to = TextEditingController();
  final cost = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }



  List<Transactions> transaction = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Builder(
        builder: (ctx) => SafeArea(
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
                  controller: title,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'From',
                    labelText: 'From',
                  ),
                  controller: from,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'To',
                    labelText: 'To',
                  ),
                  controller: to,
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     icon: Icon(Icons.calendar_today),
                //     hintText: 'Enter today\'s date',
                //   ),
                //   keyboardType: TextInputType.datetime,
                //   controller: dateTime,
                // ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: 'Cost',
                    labelText: 'Cost',
                  ),
                  controller: cost,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Chosen!'
                              : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.redAccent,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _presentDatePicker,
                      ),
                    ],
                  ),
                ),

                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Yay! Item Added!'),
                    );
                    Scaffold.of(ctx).showSnackBar(snackBar);
                    widget.addNewTransaction(
                      title.text,
                      from.text,
                      to.text,
                      double.parse(
                        cost.text,
                      ),
                      DateTime.parse(_selectedDate.toString()),
                    );
                    title.text = "";
                    from.text = "";
                    to.text = "";
                    cost.text = "";
                    //_selectedDate.toString( = "";
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// validator: (value) {
//       if (value.isEmpty) {
//         return 'Enter your last name';
//       }
//       return null;
//     },
//     onSaved: (value) {
//       cost=value;
//     },
