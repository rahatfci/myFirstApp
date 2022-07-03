import 'package:flutter/material.dart';
import 'package:sdmga_project/widgets/category.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);
  @override
  _GenderState createState() => _GenderState();
}

List<bool>selected = [true, false, false];
List<String>genders = ["Man", "Woman", "Kids"];

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: genders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  for(int i=0; i<selected.length; i++){
                    selected[i] = false;
                  }
                  selected[index] = true;
                  Category.genderChanged = true;
                  Category.gender.value = index;
                });
              },
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(genders[index], style: textStyle(index),),
                      bottomLine(index)
                    ],
                  ),
                  const SizedBox(width: 25,)
                ],
              )
            );
          }
        ),
      ),
    );
  }

  Widget bottomLine(index){
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 1),
      height: 2,
      width: 80,
      color: selected[index]?const Color(0xFF6200EE):Colors.transparent,
    );
  }
  
  TextStyle textStyle(index){
    return TextStyle(
      color: selected[index]?const Color(0xFF6200EE):Colors.grey,
      fontSize: 20,
      fontWeight: FontWeight.w600
    );
  }
}