import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class MessageChat {
  String idFrom;
  String idTo;
  String timeStamp;
  String content;
  String type;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timeStamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.idFrom: this.idFrom,
      FirestoreConstants.idTo: this.idTo,
      FirestoreConstants.timeStamp: this.timeStamp,
      FirestoreConstants.content: this.content,
      FirestoreConstants.type: this.type,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(FirestoreConstants.idFrom);
    String idTo = doc.get(FirestoreConstants.idTo);
    String timeStamp = doc.get(FirestoreConstants.timeStamp);
    String content = doc.get(FirestoreConstants.content);
    String type = doc.get(FirestoreConstants.type);
    return MessageChat(
      idFrom: idFrom,
      idTo: idTo,
      timeStamp: timeStamp,
      content: content,
      type: type,
    );
  }
}
