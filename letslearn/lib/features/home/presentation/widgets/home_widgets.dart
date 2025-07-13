import 'package:flutter/material.dart';

class HomeTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  HomeTileWidget({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}