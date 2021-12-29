mixin Collections {
  static const chat = "chat_collection";
  static const messages = "messages";
}

mixin Fields {
  static const createdAt = "created_at";
}

// extension DocumentReferenceX on DocumentReference<Map<String, dynamic>> {
//   Stream<DocumentSnapshot<Map<String, dynamic>>>
//       snapshotsCreateIfNeeded() async* {
//     final first = await get();
//     if (first.exists == false || first.data() == null) {
//       set({}, SetOptions(merge: true));
//     }
//     yield* snapshots();
//   }
// }
