


import 'package:onebeat_darkmode/Users/User.dart';

class TrainerUser extends BasicUser{

  late bool firstFaq;
  late bool firstMeasure;
  late bool firstExcerise;

  late double kgWeight;
  late double cmHeight;
  late double cmStomachSize;
  late double cmArmSize;
  late double bodyFatPercentage;

  late double goalkgWeight;
  late double goalcmHeight;
  late double goalcmStomachSize;
  late double goalcmArmSize;
  late double goalbodyFatPercentage;

  TrainerUser(name,email,priv,this.firstFaq,this.firstMeasure,
      this.firstExcerise,this.kgWeight,this.cmHeight,this.cmStomachSize,
      this.cmArmSize,this.bodyFatPercentage,this.goalkgWeight,this.goalcmArmSize,this.goalcmStomachSize,this.goalcmHeight,this.goalbodyFatPercentage) : super(name, email, priv){


  }

}