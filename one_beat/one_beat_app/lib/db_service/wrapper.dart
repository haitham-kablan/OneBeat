
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_beat_app/WelcomePage/WelcomePagePortrait.dart';

import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null){
      return Container();
    }else{
      return WelcomePagePortrait();
    }
  }
}
