import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}

void main() {
  runApp(ContactListApp());
}

class ContactListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'SH Jobayer',
      email: 'shjobayer420@gmail.com',
      phoneNumber: '+8801679581356',
    ),
    Contact(
      name: 'Md Mahadi',
      email: 'mahadi@gmail.com',
      phoneNumber: '+8801679581357',
    ),
    Contact(
      name: 'John Cina',
      email: 'Cina@gmail.com',
      phoneNumber: '+8801679581358',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ContactDetailsSheet(contact: contact),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailsSheet extends StatelessWidget {
  final Contact contact;

  const ContactDetailsSheet({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Name: ${contact.name}'),
            Text('Email: ${contact.email}'),
            Text('Phone Number: ${contact.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
