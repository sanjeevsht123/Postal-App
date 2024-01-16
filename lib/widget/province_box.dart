import 'package:flutter/material.dart';
import 'package:postal_app/screens/district.dart';

class province_box extends StatelessWidget {
  final String province_name;
  final String img_path;
  final int id;
  const province_box({super.key, required this.province_name, required this.img_path, required this.id});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>district(province_name: province_name,id: id,)));
      },
      child: Container(
                      alignment: Alignment.center,
                      child: Text("$province_name",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                        image: DecorationImage(
                          image: AssetImage(img_path),
                          opacity: 5000.0 ,
                          fit: BoxFit.cover,
                          ),
                        
                      ),
                  ),
    );
  }
}