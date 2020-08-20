//import 'package:flutter/material.dart';
import 'dbHelper.dart';

class Transactions {
  String   title;
  String   from;
  String   to;
  double   cost;
  DateTime dateTime;
  String   id;

  Transactions({this.title, this.from, this.to, this.cost, this.dateTime, this.id});

  Transactions.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    from = map['from'];
    to = map['to'];
    cost = map['cost'];
    dateTime = map['dateTime'];
    id = map['id'];
  }
 
  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnFrom: from,
      DatabaseHelper.columnTo: to,
      DatabaseHelper.columnCost: cost,
      DatabaseHelper.columnDateTime: dateTime,
      DatabaseHelper.columnId: id,
    };
  }
 }