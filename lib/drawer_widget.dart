import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add new category"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Leave a rating!"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Donate"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Text(
            "Note that those buttons don't have a functionality yet!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}