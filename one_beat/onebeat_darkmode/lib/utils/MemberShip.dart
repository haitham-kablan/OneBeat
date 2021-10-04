

class MemberShip{

  final String startDay;
  final String startMonth;
  final String startYear;
  final String endDay;
  final String endMonth;
  final String endYear;

  final int time;

  MemberShip( this.startDay, this.startMonth, this.startYear, this.endDay, this.endMonth, this.endYear,this.time);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = Map();
    map["startDay"] = this.startDay;
    map["startMonth"] = this.startMonth;
    map["startYear"] = this.startYear;
    map["endDay"] = this.endDay;
    map["endMonth"] = this.endMonth;
    map["endYear"] = this.endYear;
    map["time"] = time;
    return map;
  }

  static MemberShip fromMap(Map<String,dynamic> map){
    return MemberShip(map["startDay"],map["startMonth"],map["startYear"], map["endDay"],map["endMonth"] ,map["endYear"], map["time"]);
  }
}