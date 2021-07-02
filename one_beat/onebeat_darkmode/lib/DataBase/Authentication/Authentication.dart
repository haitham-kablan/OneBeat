

import 'package:firebase_auth/firebase_auth.dart';

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




}