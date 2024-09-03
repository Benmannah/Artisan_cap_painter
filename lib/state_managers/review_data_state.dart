import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artisan_cap_painter/services/firestore_services.dart';

import '../models/review_mode.dart';

final reviewStreamProvider = StreamProvider.autoDispose
    .family<List<ReviewModel>, String>((ref, uid) async* {
  var data = FireStoreServices.getReviews(uid);
  ref.onDispose(() {
    data.drain();
  });
  List<ReviewModel> reviews = [];
  await for (var item in data) {
    reviews = item.docs.map((e) => ReviewModel.fromMap(e.data())).toList();
    yield reviews;
  }
});
