import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enently/core/model/category_model.dart';
import 'package:enently/core/model/event_model.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/utils/utils_const.dart';
import 'package:enently/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) async {
    await _db
        .collection(RemoteConst.users)
        .doc(userModel.id)
        .set(userModel.toJson());
  }

  static Future<UserModel?> getUser(String userId) async {
    final docSnapshot = await _db
        .collection(RemoteConst.users)
        .doc(userId)
        .get();

    if (docSnapshot.data() != null) {
      return UserModel.fromJson(docSnapshot.data()!);
    }

    return null;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return _db
        .collection(RemoteConst.users)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> addEventToFavourite(String eventId) async {
    final user = UserModel.currentUser!;

    user.favouriteEventsIds.add(eventId);

    await getUsersCollection().doc(user.id).set(user, SetOptions(merge: true));
  }

  static Future<void> removeEventFromFavourite(String eventId) async {
    final user = UserModel.currentUser!;

    user.favouriteEventsIds.remove(eventId);

    await getUsersCollection().doc(user.id).set(user, SetOptions(merge: true));
  }

  static Future<List<EventModel>> getFavouriteEvents(
    CollectionReference<EventModel> eventsCollection,
  ) async {
    final ids = UserModel.currentUser!.favouriteEventsIds;

    if (ids.isEmpty) return [];

    final snapshot = await eventsCollection
        .where(FieldPath.documentId, whereIn: ids)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static CollectionReference<EventModel> getEventsCollection(
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _db
        .collection(RemoteConst.event)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventFromFireStore(
    BuildContext context, [
    CategoryModel? selectedCategory,
  ]) async {
    final eventsCollection = getEventsCollection(context);

    Query<EventModel> query = eventsCollection;

    if (selectedCategory != null && selectedCategory.id != '0') {
      query = query.where("categoryId", isEqualTo: selectedCategory.id);
    }

    final snapshot = await query.orderBy("dateTime").get();

    final events = snapshot.docs.map((doc) => doc.data()).toList();

    return events;
  }

  static Future<void> loadCurrentUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) return;

    final user = await StoreService.getUser(firebaseUser.uid);

    if (user != null) {
      UserModel.currentUser = user;
    }
  }
}
