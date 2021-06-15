
class FAQ{
  final String question;
  final String category;
  final String sender;
  final DateTime date;
  late String answer;

  FAQ(this.question, this.category,this.sender,this.date){
    answer = "";
  }


}