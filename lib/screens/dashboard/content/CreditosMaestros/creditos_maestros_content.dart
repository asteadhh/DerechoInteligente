import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pulpox_admin/constants/firebase_auth_constants.dart';

class CreditosMaestrosContent extends StatelessWidget {
  const CreditosMaestrosContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .snapshots();
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Text(snapshot.data!.docs[0]['correo']);
        },
      ),
    );
    ;
  }
}
