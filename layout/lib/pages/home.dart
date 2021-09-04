import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';


class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cryptocurrency knowledge",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)) ,  backgroundColor: Colors.yellow[200]),
        backgroundColor: Colors.yellow[50],
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);
                },
                itemCount: data.length);
            },
            future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )
        )
    );
  }

  Widget MyBox(String title, String subtitle ,String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      //color: Colors.green,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.darken)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What is $title?", style:  TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold) ),
           SizedBox(height: 8,),
          Text(subtitle, style: TextStyle(fontSize: 20, color: Colors.white),),

          SizedBox(height: 15,),
          TextButton(onPressed: () {
            print("TEST");
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(v1, v2, v3, v4)));
          }, child: Text("More details in this link!",style:TextStyle(fontSize: 15, color: Colors.lightBlue[100]),
          ),
          )
        ],
      )
    );
  }
}