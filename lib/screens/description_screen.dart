import 'package:ecommerceappusingapi/constants/image_urls.dart';
import 'package:ecommerceappusingapi/models/products_model.dart';
import 'package:ecommerceappusingapi/viewModel/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionScreen extends StatefulWidget {
  final ProductsModel products;

  const DescriptionScreen({super.key, required this.products});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: BoxBorder.all(
                            width: 2,
                            color: Colors.black12,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.arrow_back_ios, size: 23),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        final data = ProductsViewModel().getCart();
                        print(data);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: BoxBorder.all(
                            width: 2,
                            color: Colors.black12,
                          ),
                        ),
                        child: Icon(Icons.favorite_border_outlined, size: 23),
                      ),
                    ),
                    SizedBox(width: 5),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: BoxBorder.all(width: 2, color: Colors.black12),
                      ),
                      child: Icon(Icons.share_outlined, size: 23),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: BoxBorder.all(width: 2, color: Colors.black12),
                      ),
                      child: Icon(Icons.shopping_cart_outlined, size: 23),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Container(
                  height: height * 0.30,
                  width: width * 0.8,

                  child: Center(
                    child: Image.network(
                      widget.products.image.toString(),
                      fit: BoxFit.fill,
                      height: height * 0.45,
                      width: width * 0.8,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.products.title.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'By',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(width: 5),

                    Text(
                      'Haier',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    RatingBarIndicator(
                      rating: widget.products.rating!.rate!.toDouble(),
                      itemCount: 5,
                      itemSize: 25.0,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: Colors.amber),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$1099.99',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                            border: BoxBorder.all(
                              width: 2,
                              color: Colors.black12,
                            ),
                          ),
                          child: Center(child: Icon(Icons.remove, size: 20)),
                        ),
                        SizedBox(width: 10),

                        Text('1', style: TextStyle(fontSize: 23)),
                        SizedBox(width: 10),

                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                            border: BoxBorder.all(
                              width: 1.5,
                              color: Colors.blue,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),

                Divider(thickness: 2),
                SizedBox(height: 5),

                Text(
                  widget.products.description.toString().trimRight(),

                  style: GoogleFonts.poppins(),
                ),

                SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          shadowColor: Colors.blue.shade50,
                          elevation: 4,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          side: BorderSide(color: Colors.blue),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Buy Now',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,

                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          side: BorderSide(color: Colors.blue),
                        ),
                        onPressed: () async {
                          final newPro = ProductsModel(
                            title: 'Iphone',
                            description: 'Apple',
                            image: ImageUrls.clothes,
                          );
                          ProductsModel? created = await ProductsViewModel()
                              .postProducts(newPro);
                          if (created != null) {
                            print('Product added${created.id}');
                          } else {
                            print('Error');
                          }
                          setState(() {});
                        },
                        child: Text(
                          'Add to Cart',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
