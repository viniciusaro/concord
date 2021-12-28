import 'package:cloud_firestore/cloud_firestore.dart';

const chatCollection = "chat_collection";
const messagesCollection = "messages";

extension DocumentReferenceX on DocumentReference<Map<String, dynamic>> {
  Stream<DocumentSnapshot<Map<String, dynamic>>>
      snapshotsCreateIfNeeded() async* {
    final first = await get();
    if (first.exists == false || first.data() == null) {
      set({}, SetOptions(merge: true));
    }
    yield* snapshots();
  }
}
