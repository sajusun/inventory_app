import 'package:firebase_auth/firebase_auth.dart';

class PathLink{
  static String userData="userData/${FirebaseAuth.instance.currentUser?.uid.toString()}";
  static String userProfile="userProfile/";


}