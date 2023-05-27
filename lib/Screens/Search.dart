import 'dart:ffi';

import 'package:flutter/material.dart';

import '../custom_button.dart';
import '../utils/colors.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var isAvail = true;
  bool _isFurnished = false;
  int _selectedBedrooms = 0;
  int _selectedBathrooms = 0;
  int _minBudget = 0;
  int _maxBudget = 0;
  List<String> localities=[];
  List<int> _bedrooms = [1, 2, 3, 4, 5];
  List<int> _bathrooms = [1, 2, 3, 4, 5];
  TextEditingController _ctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isAvail == true
          ? InkWell(
        onTap: () {
          setState(() {
            isAvail = false;
            print(isAvail);
          });
        },
        child: SearchBar(),
      )
          : Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextField(
                    controller: _ctrl,
                    onSubmitted:(state){
                      setState(() {
                        localities.add(state);
                        _ctrl.clear();
                      });
                    },
                    decoration: const InputDecoration(
                      label: Text('  Enter loclity'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  Container(
                    margin: localities.isEmpty?null:EdgeInsets.only(top: 10,bottom: 10),
                    height: localities.isEmpty?0:30.0,
                    child: new ListView(
                      scrollDirection: Axis.horizontal,
                      children: new List.generate(localities.length, (int index) {
                        return Card(
                          color: Colors.white54,
                          child: new Container(
                            width: 80.0,
                            height: 60.0,
                            child: Center(child: Text("${localities[index]} ",style: TextStyle(color: Colors.black),)),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Text(
                    'Furnished:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SwitchListTile(
                    title: Text('Is Furnished'),
                    value: _isFurnished,
                    onChanged: (value) {
                      setState(() {
                        _isFurnished = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bedrooms:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: _bedrooms
                        .map((bedroom) => buildChoice(bedroom))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bathrooms:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: _bathrooms.map((bathroom) => buildChoiceChip(bathroom))
                        .toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Budget:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Min',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _minBudget = int.tryParse(value)!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Max',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _maxBudget = int.tryParse(value)!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
          ),
        ),
      ),
      bottomNavigationBar: !isAvail?Material(
        color: blueColor,
        child: InkWell(
          onTap: () {
            setState(() {
              isAvail=true;
            });
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ):null,
    );
  }

  ChoiceChip buildChoiceChip(int bathroom) {
    return ChoiceChip(
      label: Text('$bathroom'),
      selectedColor: blueColor,
      selected: _selectedBathrooms == bathroom,
      onSelected: (selected) {
        setState(() {
          _selectedBathrooms = (selected ? bathroom : null)!;
        });
      },
    );
  }

  ChoiceChip buildChoice(int bathroom) {
    return ChoiceChip(
      label: Text('$bathroom'),
      selectedColor: blueColor,
      selected: _selectedBedrooms == bathroom,
      onSelected: (selected) {
        setState(() {
          _selectedBedrooms = (selected ? bathroom : null)!;
        });
      },
    );
  }
}
class TopText extends StatelessWidget {
  final String text;

  const TopText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.black12,
      child: Container(
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(top: 15, left: 12),
          child: Text(
            'Search',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white54,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                  spreadRadius: 5.0,
                  offset: Offset(5.0, 5.0))
            ]),
      ),
    );
  }
}
