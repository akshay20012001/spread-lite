import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feeds'),
        ),
        body: ListView.builder(
            itemCount: 10, itemBuilder: (context, index) => Adaptordesign())
        // Column(
        //   children: [
        //     Adaptordesign(),
        //     Adaptordesign(),
        //   ],
        // ),
        );
  }

  Widget Adaptordesign() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      "https://petapixel.com/assets/uploads/2019/09/5-2.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text("Name"),
                      Text("Description"),
                    ],
                  ),
                ),
                Spacer(),
                Icon(Icons.delete)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
