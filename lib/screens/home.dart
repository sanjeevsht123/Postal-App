import 'package:flutter/material.dart';
import 'package:postal_app/widget/drawer_items.dart';
import 'package:postal_app/widget/province_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Map> provinces=[
            {
              "id":1,
              "name":"Province 1",
              "img_path":"assets/province_1.jpg"
              },
              {
              "id":2,
              "name":"Madesh Pradesh",
              "img_path":"assets/madesh.jpg"
              },
              {
              "id":3,
              "name":"Bagmati",
              "img_path":"assets/bagmati.jpg"
              },
              {
              "id":4,
              "name":"Gandaki",
              "img_path":"assets/gandaki.jpg"
              },
              {
              "id":5,
              "name":"Lumbani",
              "img_path":"assets/lumbani.jpg"
              },
              {
              "id":6,
              "name":"Karnali",
              "img_path":"assets/karnali.jpg"
              },
              {
              "id":7,
              "name":"Sudur Paschim",
              "img_path":"assets/sudur_paschim.jpg"
              }
            
            ];
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              color: Colors.teal[400],
              child: Text("Nepal Postal",style:TextStyle(
                fontSize: 30,
              ),),
            ),
            drawer_items(title_name: "Home",leading_icon: Icon(Icons.home),),
            drawer_items(title_name: "About Us",leading_icon: Icon(Icons.browse_gallery_rounded),),
            drawer_items(title_name: "Contact",leading_icon: Icon(Icons.phone),),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Nepal Postal"),
        centerTitle: true,

      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Province:",style:Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            Expanded(
              child: GridView.builder( 
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index){
                  return province_box(province_name: provinces[index]['name'],img_path: provinces[index]['img_path'],id:provinces[index]['id']);
                },
                itemCount: provinces.length,
              ),
            )
          ],
        ),
      )
    );
  }
}