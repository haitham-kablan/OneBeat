

import 'dart:collection';

class Faq{

  final String publisherEmail;
  final String publisherName;
  final DateTime date;
  final String question;
  final String answer;
  final List<String> categoreis;

  Faq(this.publisherEmail, this.publisherName, this.date, this.question, this.answer, this.categoreis);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = HashMap();
    map["publisherEmail"] =  publisherEmail;
    map["publisherName"] = publisherName;
    map["date"] = date.toString();
    map["question"] = question;
    map["answer"] = answer;
    map["categoreis"] = categoreis;
    return map;
  }


}

