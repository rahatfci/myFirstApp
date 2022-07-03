import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdmga_project/widgets/items.dart';

class Details extends StatefulWidget {
  const Details(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.product.bg_color,
        actions: [
          IconButton(
              tooltip: "Search",
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: "Cart",
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        color: widget.product.bg_color,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.title, style: const TextStyle(color: Colors.white),),
                    Text(widget.product.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                  ]
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Hero(tag: widget.product.image, child: Image.asset(widget.product.image, height: 200, width: 200,)),
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Price", style: TextStyle(color: Colors.white),),
                          Text(widget.product.price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                        ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Color", style: textStyle(),),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(color: widget.product.item_color!),
                                          ),
                                          child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: widget.product.item_color,
                                              )
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),
                            const SizedBox(width: 30,),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Size", style: textStyle(),),
                                  Text(widget.product.size, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(height: 100, child: SingleChildScrollView(child: Text(widget.product.desc, style: textStyle(),))),
                        const SizedBox(height: 10,),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  child: InkWell(child: const Icon(Icons.remove), onTap: ()=>setCount(false),),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Text(count<10?"0$count":"$count", style: const TextStyle( fontWeight: FontWeight.w500, fontSize: 25),),
                                const SizedBox(width: 5,),
                                Container(
                                  width: 40,
                                  child: InkWell(child: const Icon(Icons.add), onTap: ()=>setCount(true),),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: IconButton(icon: Icon(favorite?Icons.favorite:Icons.favorite_border, color: Colors.pink,), onPressed: ()=>setFavorite())
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: widget.product.bg_color!),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(Icons.shopping_cart, size: 28, color: widget.product.bg_color,),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: widget.product.bg_color,
                                      border: Border.all(color: widget.product.bg_color!),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: const Text("BUY NOW", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  int count = 01;
  bool favorite = false;

  TextStyle textStyle(){
    return const TextStyle(
      height: 1.6
    );
  }

  void setCount(add){
    add?count++:count>1?count--:count;
    setState(() {});
  }
  void setFavorite(){
    favorite = !favorite;
    setState(() {});
  }
}