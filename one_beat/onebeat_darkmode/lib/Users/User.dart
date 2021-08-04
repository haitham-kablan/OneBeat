

enum Privillage {TRAINER , COACH}

class BasicUser{
  String name;
  String email;
  Privillage privillage;
  BasicUser(this.name,this.email,this.privillage);
}