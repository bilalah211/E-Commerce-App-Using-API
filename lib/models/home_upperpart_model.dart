import 'package:ecommerceappusingapi/constants/image_urls.dart';

class UpperListViewItem {
  final String title;
  final String subtitle;
  final String shopNow;
  final String imageUrl;

  UpperListViewItem({
    required this.title,
    required this.subtitle,
    required this.shopNow,
    required this.imageUrl,
  });
}

List<UpperListViewItem> upperListViewItems = [
  UpperListViewItem(
    title: 'Iphone 17 Series ',
    subtitle: 'Hot And Special Release',
    shopNow: 'Shop Now',
    imageUrl: ImageUrls.iphone,
  ),
  UpperListViewItem(
    title: 'Decent Wear ',
    subtitle: 'Lets Make Yourself Amazing',
    shopNow: 'Shop Now',
    imageUrl: ImageUrls.clothes,
  ),
  UpperListViewItem(
    title: 'Watches ',
    subtitle: 'Groom Your Personality',
    shopNow: 'Shop Now',
    imageUrl: ImageUrls.watches,
  ),
];
