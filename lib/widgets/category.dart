import 'package:flutter/material.dart';
import 'package:sdmga_project/widgets/items.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);
  static ValueNotifier<int> gender = ValueNotifier(0);
  static bool genderChanged = true;
  @override
  _CategoryState createState() => _CategoryState();
}

List<bool>isSelected = [];
List<String>categories  = [];

class _CategoryState extends State<Category> {

  @override
  void initState(){
    super.initState();
    Items.callback = setState;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: ValueListenableBuilder(
          valueListenable: Category.gender,
          builder: (BuildContext context, int gender, Widget? child){
            if (Category.genderChanged) {
              categories.clear();
              isSelected.clear();
              if(gender==0){
                categories.addAll(["Shirt", "Pant", "Polos", "Sweater", "Footwear"]);
                isSelected.addAll([true, false, false, false, false]);
              }
              else if(gender==1){
                categories.addAll(["Hand Bag", "Jewellery", "Footwear", "Dress", "Cosmetic"]);
                isSelected.addAll([true, false, false, false, false]);
              }
              else if(gender==2){
                categories.addAll(["Top", "Bottom", "Footwear", "Accessories"]);
                isSelected.addAll([true, false, false, false]);
              }
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return GestureDetector(
                    onTap: (){
                      setState(() {
                        for(int i=0; i<isSelected.length; i++){
                          isSelected[i] = false;
                        }
                        isSelected[index] = true;
                        Items.category.value = index;
                        Category.genderChanged = false;
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(categories[index], style: textStyle(index),),
                            bottomLine(index)
                          ],
                        ),
                        const SizedBox(width: 17,)
                      ],
                    )
                );
              }
            );
          },
        ),
      ),
    );
  }

  Widget bottomLine(int index){
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 1),
      height: 2,
      width: 40,
      color: isSelected[index]?Colors.black:Colors.transparent
    );
  }
  
  TextStyle textStyle(index){
    return TextStyle(
      color: isSelected[index]?null:Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.w500
    );
  }
}