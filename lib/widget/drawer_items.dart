import 'package:flutter/material.dart';

class drawer_items extends StatelessWidget {
  final String title_name;
  final Icon leading_icon;
  const drawer_items({super.key, required this.title_name, required this.leading_icon});

  @override
  Widget build(BuildContext context) {
    return    ListTile(
              onTap: (){},
              leading: leading_icon,
              title: Text(title_name,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),),
              minLeadingWidth: 20,
            );
  }
}