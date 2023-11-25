/* 

import '../config/user_information.dart';

class AuthMethods {

  GetStorage storage = GetStorage();
  var uid;

  Future<String> loginStudent({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        String currentuser = _auth.currentUser!.uid;
        UserInformation.User_uId = currentuser;
        await storage.write('uid', UserInformation.User_uId);
        res = "success";
        print("eeeeeeeeeeeeeeee");
        print(UserInformation.User_uId);
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
 */