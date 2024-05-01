import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotes_app/model/quotes_model.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List <QuotesModel> l1 = [];
  @override

  Widget build(BuildContext context) {
    l1=ModalRoute.of(context)!.settings.arguments as List<QuotesModel>;
    return Scaffold(
      appBar: AppBar(
        title: Text("${QuotesModel}"),
      ),
      body: ListView.builder(itemCount: l1.length,
      itemBuilder:(context,index ){
        return quotes(index);
      },),
    );
  }
  Widget quotes(int index)
  {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "edit",arguments: l1[index]);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.3),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             //Padding(padding: EdgeInsets.all(10)),
             Padding(
               padding: const EdgeInsets.all(10),
               child: Align(
                 alignment: Alignment.center,
                 child: Text("${l1[index].quotes}",
                   maxLines: 3,
                   style: const TextStyle(fontFamily: 'Lugra',
                     overflow: TextOverflow.ellipsis,
                     fontSize: 15,fontWeight: FontWeight.bold,
                   ),),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(right:12),
               child: Align(alignment: Alignment.bottomRight,
                   child: Text("${l1[index].name}",
                     style: TextStyle(fontFamily: 'Lugra',fontSize: 15),)),
             ),
           ],
        ),
      ),
    );
  }
}
