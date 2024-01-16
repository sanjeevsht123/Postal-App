import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postal_app/data/postal_data.dart';

class district_postal extends StatelessWidget {
  final String district;
  const district_postal({super.key, required this.district});

  @override
  Widget build(BuildContext context) {
    final postalMap=postalCodes.where((element){
      return element['district']==district;
    },).toList();
    final post_office=postalMap.map((e)=>e['post_office'],).toSet().toList();
    final postal_code=postalMap.map((e)=>e['postal_code'],).toSet().toList();
    final post_office_type=postalMap.map((e)=>e['post_office_type'],).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(district,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body:Column(
        children: [
          SizedBox(height: 20,),
          SingleChildScrollView(
            child: DataTable(columns: const [
                  DataColumn(label: Text("Post Office")),
                  DataColumn(label: Text("Postal Code")),
                 
                ],
                rows:postalMap.map((e){
                  return DataRow(cells:[
              DataCell(Text("${e["post_office"]}"),onTap: (){
                Clipboard.setData(ClipboardData(text: e["postal_code"].toString()));
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Postal Code of ${e["post_office"]} is coppied")));
                
              }),
              DataCell(Text("${e["postal_code"]}")),
                  ] );
                }).toList()
                ),
          )
        ],
      )
    );
  }
}