import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Badd extends StatefulWidget {
  const Badd({super.key});

  @override
  State<Badd> createState() => _BaddState();
}

class _BaddState extends State<Badd> {
  List<String> bloodGroups = ['A+', 'O+', 'B-'];
  final CollectionReference donor = FirebaseFirestore.instance.collection(
    'donor',
  );
  String? selectedgrp;
  void adddonor() {
    final data = {
      'name': donorname.text,
      'phone': donorphone,
      'group': selectedgrp,
    };
    donor.add(data);
  }

  TextEditingController donorname = TextEditingController();
  TextEditingController donorphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Add Blood Group'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: donorname,
              decoration: InputDecoration(
                label: Text('donor Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: donorphone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                label: Text('Phone Number'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Blood Group',
              ),
              value: selectedgrp,
              items:
                  bloodGroups.map((group) {
                    return DropdownMenuItem(value: group, child: Text(group));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedgrp = value!;
                });
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),

              onPressed: () {
                adddonor();
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
