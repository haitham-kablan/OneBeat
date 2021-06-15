
enum EXCERICES_CATEGORY{CHEST,BACK,SHOULDERS,LEGS,ARMS,AEROBE,GENERAL}

class Excersice{

  final String name;
  final String category;
  final String description;
  final String hints;
  final String video_url;

  Excersice(this.name, this.category, this.description, this.hints, this.video_url);
}