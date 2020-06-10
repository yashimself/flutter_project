import 'package:coffee_app/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/user.dart';


class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  
  //collection reference
final CollectionReference brewCollection = Firestore.instance.collection('brews');

Future updateUserData(String sugar,String name, int strength) async{
  return await brewCollection.document(uid).setData({
    'sugar':sugar,
    'name' : name,
    'strength' : strength,
  });
}

//brew list from snapshot

List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugar: doc.data['sugar'] ?? '0',
      );
    }).toList();
  }
//userDAta from snapshot

UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    name: snapshot.data['name'],
    sugar: snapshot.data['sugar'],
    strength: snapshot.data['strength']
  );
}


//get brews stream

Stream<List<Brew>> get brews{
  return brewCollection.snapshots()
  .map(_brewListFromSnapshot);
}

 //get user doc stream

Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}


