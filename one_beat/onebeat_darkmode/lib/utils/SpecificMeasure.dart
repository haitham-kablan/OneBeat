

class SpecificMeasure{

  final String weight;
  final String arm;
  final String stomach;
  final String bodyfat;
  final String height;
  final DateTime dateTime;

  SpecificMeasure(this.weight, this.arm, this.stomach, this.bodyfat,this.dateTime, this.height);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = Map();
    map["weight"] = weight;
    map["height"] = height;
    map["arm"] = arm;
    map["stomach"] = stomach;
    map["bodyfat"] = bodyfat;
    map["dateTime"] = dateTime.toString();
    map["time"] = dateTime.millisecondsSinceEpoch;
    return map;
  }

  static SpecificMeasure mapToSpecificMeasure(String weight,String arm,String stomach,String bodyfat,String dateTime,String height){
    return SpecificMeasure(weight, arm, stomach, bodyfat, DateTime.parse(dateTime),height);

  }
}