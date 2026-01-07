import 'package:flutter/material.dart';
import '../models/contact_model.dart';

/* 
A widget that displays a contact list screen with the ability to add new contacts
using StatefulWidget to make widget can update when clicking floating action button

by using _addContact method from slide to add new contact to the list and update the UI

@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
*/

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  int _counter = 0;

  final List<Contact> _contacts = [
    Contact(name: "John Doe", phoneNumber: "123-456-7890"),
    Contact(name: "Jane Smith", phoneNumber: "098-765-4321"),
    Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
  ];

  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $_counter",
          phoneNumber: "000-${_counter.toString().padLeft(3, '0')}-0000",
        ),
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Contacts")),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),

            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius:0.1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _contacts[index].name,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  _contacts[index].phoneNumber,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: _addContact,
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
