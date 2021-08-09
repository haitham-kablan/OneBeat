


import 'package:onebeat_darkmode/Users/User.dart';

class TrainerUser extends BasicUser{

   bool firstFaq;
   bool firstMeasure;
   bool firstExcerise;

   double kgWeight;
   double cmHeight;
   double cmStomachSize;
   double cmArmSize;
   double bodyFatPercentage;

   double goalkgWeight;
   double goalcmHeight;
   double goalcmStomachSize;
   double goalcmArmSize;
   double goalbodyFatPercentage;

  TrainerUser(name,email,priv,this.firstFaq,this.firstMeasure,
      this.firstExcerise,this.kgWeight,this.cmHeight,this.cmStomachSize,
      this.cmArmSize,this.bodyFatPercentage,this.goalkgWeight,this.goalcmArmSize,this.goalcmStomachSize,this.goalcmHeight,this.goalbodyFatPercentage) : super(name, email, priv){


  }

}