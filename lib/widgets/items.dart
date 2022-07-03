import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sdmga_project/pages/details.dart';
import 'package:sdmga_project/widgets/category.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  static ValueNotifier<int> category = ValueNotifier<int>(0);
  static Function? callback;

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Category.gender,
        builder: (BuildContext context, int gender, Widget? child) {
          Items.category = ValueNotifier<int>(0);
          return ValueListenableBuilder(
              valueListenable: Items.category,
              builder: (BuildContext context, int category, Widget? child) {
                addProducts(category, gender);
                return Expanded(
                  child: GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        category -= 1;
                        if (category < 0) {
                          Items.category.value = categories.length - 1;
                        } else {
                          Items.category.value = category;
                        }
                      } else if (details.primaryVelocity! < 0) {
                        category += 1;
                        if (category >= categories.length) {
                          Items.category.value = 0;
                        } else {
                          Items.category.value = category;
                        }
                      }
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = false;
                      }
                      isSelected[Items.category.value] = true;
                      Category.genderChanged = false;
                      Items.callback!(() {});
                    },
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              "We are currently facing this problem: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          if (products.isEmpty) {
                            return ListView(
                              children: [
                                ListTile(
                                  title: Center(
                                      child: Text(
                                          "${categories[category]} items will arrive soon. Stay tuned:)")),
                                )
                              ],
                            );
                          }
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Details(products[index])));
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      color: products[index].bg_color,
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                          child: Hero(
                                              tag: products[index].image,
                                              child: Image(
                                                  image: AssetImage(
                                                      products[index].image)))),
                                    )),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Color(0xFF6200EE),
                          ));
                        }
                      },
                      future: getInfo(products),
                    ),
                  ),
                );
              });
        });
  }
}

void addProducts(int category, int gender) {
  products.clear();
  if (gender == 0) {
    if (category == 0) {
      products.add(Product(
          "Formal Shirt",
          "Formal cotton shirt",
          "\$40",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/shirt1.png"));
      products.add(Product(
          "Hawaii Shirt",
          "Cotton hawaii shirt",
          "\$30",
          "M",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/shirt2.png"));
      products.add(Product(
          "Check Shirt",
          "Cotton check shirt",
          "\$30",
          "XL",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/shirt3.png"));
    } else if (category == 1) {
      products.add(Product(
          "Jeans Pant",
          "Premium jeans pant",
          "\$40",
          "32",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/pant1.png"));
      products.add(Product(
          "Gabardine Pant",
          "Yellow gabardine pant",
          "\$30",
          "32",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/pant2.png"));
    } else if (category == 2) {
      products.add(Product(
          "Premium Polo",
          "Cotton polo",
          "\$12",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/polo1.png"));
      products.add(Product(
          "Premium Polo",
          "Cotton polo",
          "\$12",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/polo2.png"));
      products.add(Product(
          "Premium Polo",
          "Cotton polo",
          "\$12",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/polo3.png"));
    } else if (category == 3) {
      products.add(Product(
          "Denim Sweater",
          "Premium denim sweater",
          "\$80",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/sweater1.png"));
      products.add(Product(
          "Polyester Sweater",
          "Premium black sweater",
          "\$80",
          "L",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/sweater2.png"));
    } else if (category == 4) {
      products.add(Product(
          "Cats",
          "Brown cats",
          "\$80",
          "42",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/footwear1.png"));
      products.add(Product(
          "Playing Boot",
          "Premium playing boot",
          "\$100",
          "44",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/footwear2.png"));
      products.add(Product(
          "Leather Shoe",
          "Brown cultural shoe",
          "\$50",
          "43",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/man/footwear3.png"));
    }
  } else if (gender == 1) {
    if (category == 0) {
      products.add(Product(
          "Office Code",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_1.png"));
      products.add(Product(
          "Belt Bag",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_2.png"));
      products.add(Product(
          "Hang Top",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_3.png"));
      products.add(Product(
          "Old Fashion",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_4.png"));
      products.add(Product(
          "Shoulder Bag",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_5.png"));
      products.add(Product(
          "Document Bag",
          "Aristocratic Hand Bag",
          "\$234",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/bag_6.png"));
    } else if (category == 1) {
      products.add(Product(
          "Ring",
          "Golden ring",
          "\$1000",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/jewel2.png"));
      products.add(Product(
          "Ring",
          "Diamond ring",
          "\$1000",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/jewel3.png"));
      products.add(Product(
          "Ring",
          "Diamond ring",
          "\$1000",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/jewel4.png"));
      products.add(Product(
          "Neckless",
          "Golden neckless",
          "\$1000",
          "12cm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/jewel5.png"));
    } else if (category == 2) {
      products.add(Product(
          "High Hill",
          "Leather high hill",
          "\$120",
          "38",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/footwear1.png"));
      products.add(Product(
          "Plain Sandal",
          "Rubber sandal",
          "\$5",
          "38",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/footwear2.png"));
      products.add(Product(
          "Plain Shoe",
          "Leather plain shoe",
          "\$50",
          "38",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/footwear3.png"));
    } else if (category == 3) {
      products.add(Product(
          "Party Dress",
          "Premium party dress",
          "\$120",
          "20",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/dress1.png"));
      products.add(Product(
          "Party Dress",
          "Premium party dress",
          "\$80",
          "20",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/dress2.png"));
      products.add(Product(
          "Party Dress",
          "Normal party dress",
          "\$50",
          "20",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/dress3.png"));
    } else if (category == 4) {
      products.add(Product(
          "Lipstick",
          "Scarlet lipstick",
          "\$20",
          "20gm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/cosmetic1.png"));
      products.add(Product(
          "Face Wash",
          "Neem face wash",
          "\$10",
          "200gm",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/cosmetic2.png"));
      products.add(Product(
          "Makeup Brush",
          "Normal makeup brush",
          "\$20",
          "5",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/woman/cosmetic3.png"));
    }
  } else if (gender == 2) {
    if (category == 0) {
      products.add(Product(
          "Denim Shirt",
          "Kids denim shirt",
          "\$10",
          "12",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/top1.png"));
      products.add(Product(
          "T-Shirt",
          "Cotton T-Shirt",
          "\$5",
          "12",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/top2.png"));
    } else if (category == 1) {
      products.add(Product(
          "Kids Pant",
          "Checked cotton pant",
          "\$10",
          "15",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/bottom1.png"));
      products.add(Product(
          "Kids Pant",
          "Denim pant",
          "\$10",
          "15",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/bottom2.png"));
    } else if (category == 2) {
      products.add(Product(
          "Cats",
          "Leather cats",
          "\$120",
          "10",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/footwear1.png"));
      products.add(Product(
          "Kids Sneaker",
          "Rubber sneaker",
          "\$15",
          "10",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/footwear2.png"));
    } else if (category == 3) {
      products.add(Product(
          "Sun Glass",
          "Plastic sun glass",
          "\$5",
          "10",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/accs1.png"));
      products.add(Product(
          "Bicycle",
          "Strong bicycle",
          "\$150",
          "Medium",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been "
              "the industry's standard dummy text ever since the 1500s",
          "assets/images/kids/accs2.png"));
    }
  }
}

Future<int> getInfo(List<Product> products) async {
  for (int i = 0; i < products.length; i++) {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(AssetImage(products[i].image));
    paletteGenerator.mutedColor == null
        ? products[i].bg_color =
            paletteGenerator.dominantColor!.color.withOpacity(.8)
        : products[i].bg_color =
            paletteGenerator.mutedColor!.color.withOpacity(.8);
    products[i].item_color = paletteGenerator.dominantColor!.color;
  }
  return 0;
}

List<Product> products = [];

class Product {
  String name;
  String title;
  String price;
  String size;
  String desc;
  bool? isAvailable;
  Color? bg_color;
  Color? item_color;
  String image;
  Product(this.name, this.title, this.price, this.size, this.desc, this.image,
      {isAvailable = true, color});
}
