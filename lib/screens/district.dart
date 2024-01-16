import 'package:flutter/material.dart';
import 'package:postal_app/screens/district_postal.dart';

import '../data/postal_data.dart';

class district extends StatelessWidget {
  final String province_name;
  final int id;
  const district({super.key, required this.province_name, required this.id});

  @override
  Widget build(BuildContext context) {
    final districtMap= postalCodes.where((element){
        return element["province"]==id;
      }).toList();
      final district=districtMap.map((e) => e['district']).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(province_name,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black, 
      ),),
      centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Districts:",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
            fontSize: 20,
          ),),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>district_postal(district:district[index] ,)));
                  },
                  leading: Icon(Icons.location_disabled_outlined),
                  minLeadingWidth: 30,
                  title: Text(district[index],style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  
                );
            },
            itemCount: district.length,
            ),
          )
        ]),
      ),
      
    );
  }
}