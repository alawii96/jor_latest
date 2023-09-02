import 'package:flutter/material.dart';

class ArchiviingPage extends StatefulWidget {
  const ArchiviingPage({super.key});

  @override
  State<ArchiviingPage> createState() => _ArchiviingPageState();
}

class _ArchiviingPageState extends State<ArchiviingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _cifController = TextEditingController();

    TextEditingController _emailController = TextEditingController();

    TextEditingController _bulkController = TextEditingController();

    return Expanded(
      child: Container(
        child: Column(children: [
          TextFormField(
            controller: _cifController,
            decoration: InputDecoration(hintText: "CIF"),
          ),
          TextFormField(
            controller: _cifController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: _cifController,
            decoration: InputDecoration(hintText: "Bulk CIF"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("SQL Archiving")),
          ElevatedButton(
            onPressed: () {},
            child: Text("Bulk Archiving"),
          ),
        ]),
      ),
    );
  }
}
