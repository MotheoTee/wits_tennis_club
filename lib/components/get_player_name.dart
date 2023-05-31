import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetPlayerName extends StatelessWidget {
  final String documentId;
  const GetPlayerName({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference players = FirebaseFirestore.instance.collection('players');
    return FutureBuilder<DocumentSnapshot>(
      future: players.doc(documentId).get(),
        builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['name']}' +' '+ '${data['surname']}' + '          '+ 'Role: ${data['role']}');
      }
      return Text('loading...');
    });
  }
}
