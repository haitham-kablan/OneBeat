

import 'package:firebase_auth/firebase_auth.dart';
import 'package:onebeat_darkmode/DataBase/Services/DataBaseService.dart';
import 'package:onebeat_darkmode/DataBase/User/GymHeroUser.dart';
import 'package:onebeat_darkmode/Users/TrainerUser.dart';
import 'package:onebeat_darkmode/Users/User.dart';

class AuthenticationService{


   static Future<String?> Login(String email,String password) async{

     try {
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email,
           password: password
       );
       return null;
     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         return  "דואל זה אינו קיים במערכת";
       } else if (e.code == 'wrong-password') {
         return "הסיסמה לא תואמת לדואל";
       }
     } catch (e) {
       return "אין חיבור לאנטרניט";
     }

   }

   static Future Logout() async{
     await FirebaseAuth.instance.signOut();
   }

   static Future<String?> Reigester(String email,String password,String userName) async{
     try {
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email,
           password: password
       );
       return null;
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         return "הסיסמה חייבת להיות לפחות 6 תווים";
       } else if (e.code == 'email-already-in-use') {
         return "דואל זה כבר קיים במערכת";
       }
     } catch (e) {
       return "אין חיבור לאנטרניט";
     }

   }


   static Future<GymHeroUser> getCurrentUser() async {

     User? usr = await FirebaseAuth.instance.currentUser;
     if(usr == null){
       return GymHeroUser.emptyUser("", "");
     }
     return await DataBaseService.getUser(usr.email!);
   }


}