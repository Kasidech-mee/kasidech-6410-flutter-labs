import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.addrName,
    required this.addrInfo,
    required this.email,
    required this.phone,
  });

  final String addrName;
  final String addrInfo;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                addrName,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(addrInfo),
              leading: Icon(Icons.apartment, color: Theme.of(context).colorScheme.primary),
            ),
            Divider(),
            ListTile(
              title: Text(phone, style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              title: Text(email),
              leading: Icon(
                Icons.contact_mail,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
