import 'dart:ffi';



class Transaction
{
  String title;
  String from;
  String to;
  Float cost;
  DateTime dateTime;

  Transaction({this.title,this.from,this.to,this.cost,this.dateTime});

}