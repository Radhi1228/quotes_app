import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/model/quotes_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {


  Color selectedColor = Colors.black;
  String selectedImage = "assets/images/img1.jpeg";
  String? selectFont ="anek";
  FontStyle italic = FontStyle.normal;
  FontWeight bold = FontWeight.normal;
  TextDecoration underline = TextDecoration.none;


  bool forImage = false;
  bool forColor = false;
  bool forFont = false;
  bool forField = false;



  List imageList = [
    "assets/images/img1.jpeg",
    "assets/images/img2.jpeg",
    "assets/images/img3.jpeg",
    "assets/images/img4.jpeg",
    "assets/images/img5.jpeg",
    "assets/images/img6.jpeg",
    "assets/images/img7.jpeg",
    "assets/images/img8.jpeg",
    "assets/images/img9.jpeg"
  ];

  List fontList = ['anek', 'Dancing', 'fontstyle', 'Oswald','lugra'];

  @override
  Widget build(BuildContext context) {
    QuotesModel model =
        ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width * 0.90,
              width: MediaQuery.sizeOf(context).width * 0.90,
              color: Colors.amber,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    selectedImage,
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).width * 0.90,
                    width: MediaQuery.sizeOf(context).width * 0.90,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "${model.quotes}",
                        style: TextStyle(
                            color: selectedColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: selectFont,

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${model.name}",
                        style: TextStyle(
                          color: selectedColor,
                          fontFamily: selectFont,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Padding(padding: EdgeInsets.only(right: )),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forImage = !forImage;
                      forColor = false;
                      forFont = false;
                    });
                  },
                  icon: Icon(Icons.image),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forColor = !forColor;
                      forImage = false;
                      forFont = false;
                    });
                  },
                  icon: Icon(Icons.color_lens),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    setState(() {
                      forFont = !forFont;
                      forImage = false;
                      forColor = false;
                    });
                  },
                  icon: Icon(Icons.text_format),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.save_alt),
                ),
              ],
            ),
            Visibility(
              visible: forColor,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: Colors.primaries.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.primaries[index];
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.primaries[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: forImage,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = imageList[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "${imageList[index]}",
                        fit: BoxFit.cover,
                      ),
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: forFont,
              child: Expanded(
                  child: ListView.builder(
                itemCount: fontList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectFont = fontList[index];
                    });
                  },
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,top: 20),
                      child: Text(
                        "Edit Your Screen",
                        style: TextStyle(
                          fontFamily: fontList[index],
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ),
            Visibility(
              visible: forField,
                child: const Expanded(
                  child: Row(

                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
