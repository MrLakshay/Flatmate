import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Item> items = [
    Item(
      title: 'Item 1',
      image: 'assets/item1.jpg',
      details: 'Details of Item 1',
    ),
    Item(
      title: 'Item 2',
      image: 'assets/item2.jpg',
      details: 'Details of Item 2',
    ),
    Item(
      title: 'Item 3',
      image: 'assets/item3.jpg',
      details: 'Details of Item 3',
    ),
    Item(
      title: 'Item 4',
      image: 'assets/item4.jpg',
      details: 'Details of Item 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle item tap here
              // You can navigate to a new screen or perform any other action
              print('Tapped on item: ${items[index].title}');
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    items[index].image,
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      items[index].title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text(
                      items[index].details,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final String image;
  final String details;

  Item({required this.title, required this.image, required this.details});
}
