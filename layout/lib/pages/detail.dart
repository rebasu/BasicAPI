import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({ Key? key }) : super(key: key); 
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var _v1, _v2, _v3, _v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(_v1, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),backgroundColor: Colors.yellow[200]),
      backgroundColor: Colors.yellow[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('WHAT IS $_v1 ?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('', style: TextStyle(fontSize: 10),),
            Image.network(_v3, width: 50,),
            Text('', style: TextStyle(fontSize: 10),),
            Text(_v2, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic,),),
            Text('', style: TextStyle(fontSize: 8),),
            Text(_v4, style: TextStyle(fontSize: 18),),
            Text('\n\n\n\n\nSupport me for a cup of coffee!\n00XX-11YY-22ZZ',textAlign: TextAlign.right, style: TextStyle(fontSize: 20),)
          ],),
      ),
    );
  }
}