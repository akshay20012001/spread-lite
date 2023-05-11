import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Restrictuser extends StatefulWidget {
  const Restrictuser({super.key});

  @override
  State<Restrictuser> createState() => _RestrictuserState();
}

class _RestrictuserState extends State<Restrictuser> {
  String buttonText = 'Restrict';
  Color buttonColor = Colors.blue;

  void _changeButton() {
    setState(() {
      buttonText = 'Restricted';
      buttonColor = Colors.blueGrey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restrict user'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: 15, itemBuilder: (context, index) => res()));
  }

  Widget res() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: [Text("Name"), Text("Details")],
              ),
              Spacer(),
              MaterialButton(
                onPressed: _changeButton,
                child: Text(buttonText),
                color: buttonColor,
                textColor: Colors.white,
                highlightColor: Colors.redAccent,
                height: 25,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search logic here
    return Center(
      child: Text('Search results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your suggestion logic here
    return Center(
      child: Text('Type to search'),
    );
  }
}
