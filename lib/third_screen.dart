import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<String> selectedContacts = [];

  List<String> contacts = ['Muhammad', 'Beni', 'Fajri'];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: ScaffoldPage(
        header: const PageHeader(
          title: Text("This is Second Screen"),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile.selectable(
                  title: Text(contact),
                  selected: selectedContacts.contains(contact),
                  selectionMode: ListTileSelectionMode.multiple,
                  onSelectionChange: (selected) {
                    setState(() {
                      if (selected) {
                        selectedContacts.add(contact);
                      } else {
                        selectedContacts.remove(contact);
                      }
                    });
                  },
                );
              }
          ),
        ),
        bottomBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
