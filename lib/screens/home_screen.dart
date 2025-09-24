import 'package:ecommerceappusingapi/constants/image_urls.dart';
import 'package:ecommerceappusingapi/models/home_upperpart_model.dart';
import 'package:ecommerceappusingapi/models/products_model.dart';
import 'package:ecommerceappusingapi/screens/description_screen.dart';
import 'package:ecommerceappusingapi/screens/widgets/upper_part_rounded_container.dart';
import 'package:ecommerceappusingapi/utils/spinkit.dart';
import 'package:ecommerceappusingapi/viewModel/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductsModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductsViewModel().getProducts();
  }

  void _refreshProducts() {
    setState(() {
      _productsFuture = ProductsViewModel().getProducts();
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      border: BoxBorder.all(width: 2, color: Colors.black12),
                    ),
                    child: Icon(Icons.menu, size: 23),
                  ),
                  SizedBox(width: 85),
                  Text(
                    'E Shop',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //HomeScreen Upper Part
              SizedBox(
                width: width * 1,
                height: height * 0.25,
                child: RoundedContainer(
                  height: height * 0.25,
                  width: width * 1,
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Top Products',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),

              FutureBuilder(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          final products = snapshot.data![index];
                          return Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.grey.shade50,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),

                              borderRadius: BorderRadius.circular(15),
                              border: BoxBorder.all(color: Colors.black12),
                            ),

                            child: MySpinkit.mySpinKit,
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        shrinkWrap: true,

                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final products = snapshot.data![index];
                          return Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.grey.shade50,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),

                              borderRadius: BorderRadius.circular(15),
                              border: BoxBorder.all(color: Colors.black12),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DescriptionScreen(
                                      products: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    products.title.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  leading: SizedBox(
                                    height: 100,
                                    width: 60,
                                    child: Image.network(
                                      products.image.toString(),
                                      fit: BoxFit.cover,
                                      height: 90,
                                    ),
                                  ),
                                  subtitle: RatingBarIndicator(
                                    rating: products.rating!.rate!.toDouble(),
                                    itemCount: 5,
                                    // maximum stars
                                    itemSize: 20.0,
                                    // size of stars
                                    direction: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        Icon(Icons.star, color: Colors.amber),
                                  ),
                                  trailing: Icon(
                                    Icons.favorite_border_outlined,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'WishList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
