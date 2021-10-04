

class SpecificMeasure{

  final String weight;
  final String arm;
  final String stomach;
  final String bodyfat;
  final DateTime dateTime;

  SpecificMeasure(this.weight, this.arm, this.stomach, this.bodyfat,this.dateTime);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = Map();
    map["weight"] = weight;
    map["arm"] = arm;
    map["stomach"] = stomach;
    map["bodyfat"] = bodyfat;
    map["dateTime"] = dateTime.toString();
    map["time"] = dateTime.millisecondsSinceEpoch;
    return map;
  }

  static SpecificMeasure mapToSpecificMeasure(String weight,String arm,String stomach,String bodyfat,String dateTime){
    return SpecificMeasure(weight, arm, stomach, bodyfat, DateTime.parse(dateTime));

  }
}