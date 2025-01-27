import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:artisan_cap_painter/models/appointment_model.dart';
import 'package:artisan_cap_painter/models/review_mode.dart';
import 'package:artisan_cap_painter/models/user_model.dart';
import '../models/category_mode.dart';

class FireStoreServices {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<UserModel> getUserData(uid) async {
    var data = await _fireStore.collection('users').doc(uid).get();
    return UserModel.fromMap(data.data()!);
  }

  static setUserOnline(uid) {
    _fireStore.collection('users').doc(uid).update({'isOnline': true});
  }

  static Future<bool> userExists(String? idCard) {
    return _fireStore
        .collection('users')
        .where('idNumber', isEqualTo: idCard)
        .get()
        .then((value) => value.docs.isNotEmpty);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() {
    return _fireStore.collection('categories').snapshots();
  }

  static updateUserOnlineStatus(String uid, bool bool) async {
    await _fireStore.collection('users').doc(uid).update({'isOnline': bool});
  }

  static updateUserAvailableStatus(String uid, bool bool) async {
    await _fireStore.collection('users').doc(uid).update({'available': bool});
  }

  static Future<UserModel?> getUser(String uid) async {
    final user = await _fireStore.collection('users').doc(uid).get();
    return UserModel.fromMap(user.data()!);
  }

  // save user to firebase
  static Future<String> saveUser(UserModel user) async {
    final response = await _fireStore
        .collection('users')
        .doc(user.id)
        .set(user.toMap())
        .then((value) => 'success')
        .catchError((error) => error.toString());
    return response;
  }

  static Future<bool> addCategory(CategoryModel state) async {
    try {
      await _fireStore
          .collection('categories')
          .doc(state.id)
          .set(state.toMap());
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    } catch (e) {
      return false;
    }
  }

  static String getCatId() {
    return _fireStore.collection('categories').doc().id;
  }

  static String getDocumentId(String s) {
    return _fireStore.collection(s).doc().id;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getArtisans() {
    return _fireStore
        .collection('users')
        .where('userType', isEqualTo: 'artisan')
        .snapshots();
  }

  static Future<void> updateUserLocation(UserModel userModel) async {
    return await _fireStore
        .collection('users')
        .doc(userModel.id)
        .update(userModel.locationUpdateMap());
  }

  static Future<List<UserModel>> getAllArtisans() async {
    var data = await _fireStore
        .collection('users')
        .where('userType', isEqualTo: 'artisan')
        .get();
    return data.docs.map((e) => UserModel.fromMap(e.data())).toList();
  }

  static addReview(ReviewModel review) {
    _fireStore.collection('reviews').doc(review.id).set(review.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getReviews(String uid) {
    return _fireStore
        .collection('reviews')
        .where('artisanId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  static Future<bool> addAppointment(AppointmentModel state) async {
    try {
      await _fireStore.collection('requests').doc(state.id).set(state.toMap());
      return true;
    } on FirebaseException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getResquests(String? uid) {
    return _fireStore
        .collection('requests')
        .where('ids', arrayContains: uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  static updateRequestStatus(AppointmentModel data) async {
    await _fireStore
        .collection('requests')
        .doc(data.id)
        .update({'status': data.status});
  }

  static Future<bool> updateUserToArtisan(String? id, String category) async {
    try {
      await _fireStore
          .collection('users')
          .doc(id)
          .update({'userType': 'artisan', 'artisanCategory': category});
      return true;
    } on FirebaseException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }

  static String getUserId() {
    return _fireStore.collection('users').doc().id;
  }
}
