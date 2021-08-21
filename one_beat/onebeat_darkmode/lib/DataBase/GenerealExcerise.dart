

class GeneralExcerise{

  final String name;
  final String category;

  GeneralExcerise(this.name, this.category);

  Map<String,dynamic> toMap(){

    Map<String,dynamic> map = Map();
    map["name"] = this.name;
    map["category"] = this.category;

    return map;
  }

}

