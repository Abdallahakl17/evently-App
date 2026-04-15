import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/utils/utils_const.dart';

 class StoreService {
 static final FirebaseFirestore _db = FirebaseFirestore.instance;

 static Future<void> addUser(UserModel userModel) async {
    await _db.collection(RemoteConst.users).doc(userModel.id).set(userModel.toJson());
  }
}
