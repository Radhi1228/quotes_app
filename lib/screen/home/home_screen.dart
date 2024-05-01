import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool forGrid = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Are You Sure Want To Exit..",
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      child: const Text("No",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),),
                    TextButton(onPressed: (){
                     exit(0);
                    },
                      child: const Text("Yes",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),)
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.10),
          //centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Quotes For You",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                  onPressed: () {
                setState(() {
                  forGrid=!forGrid;
                });
              }, child: const Text("Tap")),
            )
          ],
        ),
        body: forGrid
            ?ListView.builder(
          // forGrid = !forGrid;
          scrollDirection: Axis.vertical,
          itemCount: categoryModelList.length,
          itemBuilder: (context, index) => Tile(index),
        )
            : GridView.builder(
        itemCount: categoryModelList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index)
        {
          return Tile(index);
        },
       ),
      ),
    );
  }

  Widget Tile(index) {
    return InkWell(
      onTap: (){
        List mainList = [meditation,happy,inspired,spiritual,success,love,trust,education];
        Navigator.pushNamed(context, 'quote',arguments: mainList [index]);
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage("${categoryModelList[index].image}"),
            fit: BoxFit.cover,
          ),
          color: Colors.pink.shade100,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              //margin: EdgeInsets.all(5),
             decoration: BoxDecoration(
               color: Colors.white.withOpacity(0.5,),
               borderRadius: const BorderRadius.only(
                   topRight: Radius.circular(5),
                   topLeft: Radius.circular(5),
                   bottomRight: Radius.circular(5),
               ),
             ),
              child: Text(
                "${categoryModelList[index].name}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
