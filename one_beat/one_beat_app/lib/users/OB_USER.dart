
enum Privillage{TRAINER,CLIENT}

class OB_user{

  final String name;
  final String email;
  final String profile_image_path;
  late Privillage privillage;
  late String searchKey;

  OB_user(this.name, this.email, this.profile_image_path){

    searchKey= name.substring(0,1).toUpperCase();
    privillage = Privillage.CLIENT;
  }

}
