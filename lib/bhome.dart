import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bhome extends StatefulWidget {
  const Bhome({super.key});

  @override
  State<Bhome> createState() => _BhomeState();
}

class _BhomeState extends State<Bhome> {
  final CollectionReference donor = FirebaseFirestore.instance.collection(
    'donor',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Blood Donation App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/badd');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data!.docs[index];
                return Container(height: 80, color: Colors.white,child: 
                Padding(padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(child: Padding(padding: EdgeInsets.all(5),
                      child: CircleAvatar(backgroundColor: Colors.red,
                      radius: 30,
                      child: Text(donorSnap['group']),
                      ),
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(donorSnap['name']),
                        Text(donorSnap['phone'].toString())
                      ],
                    ),Column(
                     children: [
                      IconButton(icon: Icon(Icons.delete),onPressed:(){} ),
                      IconButton(icon: Icon(Icons.edit),onPressed: (){}),
                     ], 
                    )],
                  ),
                ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
