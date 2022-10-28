import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreditosMaestrosContent extends StatelessWidget {
  const CreditosMaestrosContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
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

          return Text(snapshot.data!.docs[0]['nombre'].toString());

          // return Container(
          //   child: ListView(
          //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //       Map<String, dynamic> data =
          //           document.data()! as Map<String, dynamic>;

          //       return Text('data');
          //       // return ListTile(
          //       //     // title: Text(data['nombre']),
          //       //     // subtitle: Text(data['lastLogInOn']),
          //       //     );
          //     }).toList(),
          //   ),
          // );
        },
      ),
    );
    ;
  }
}
