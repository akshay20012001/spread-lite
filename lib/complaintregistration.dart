import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const List<String> list = <String>['section', 'C1', 'C2', 'C3', 'C4', 'C5'];

class RegPag extends StatefulWidget {
  const RegPag({super.key});

  @override
  State<RegPag> createState() => _RegPagState();
}

class _RegPagState extends State<RegPag> {
  String dropdownValue = list.first;

  late String _email;
  final _text = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaint Registration"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    hintText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    hintText: 'Semester',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    style: TextStyle(fontSize: 18, color: Colors.red),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 15, top: 8, right: 15, bottom: 0),
                      hintText: 'University Registration ID',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    hintText: 'Department',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    hintText: 'Subject',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                  maxLines: 6,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    hintText: 'Complaint',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: 300,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 36,
                    elevation: 16,
                    hint: Text("select"),
                    alignment: Alignment.center,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                },
                color: Colors.green,
                highlightColor: Colors.redAccent,
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
