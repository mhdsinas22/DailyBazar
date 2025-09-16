import 'package:bording_week1/common/const/appimages.dart';

class DummyData {
  static List<HomeGirdItems> homeGirditems = [
    HomeGirdItems(
      image: Appimages.foodDeliverySvg,
      isoffer: true,
      title: "Food Delivery",
    ),
    HomeGirdItems(
      image: Appimages.medicineSvg,
      isoffer: true,
      title: "Medicines",
    ),
    HomeGirdItems(
      image: Appimages.petsuppliesSvg,
      isoffer: true,
      title: "Pet Supplies",
    ),
    HomeGirdItems(image: Appimages.giftsSvg, isoffer: false, title: "Gifts"),
    HomeGirdItems(image: Appimages.meatSvg, isoffer: false, title: "Meat"),
    HomeGirdItems(
      image: Appimages.costmicSvg,
      isoffer: false,
      title: "Cosmetic",
    ),
    HomeGirdItems(
      image: Appimages.stationerySvg,
      isoffer: false,
      title: "Stationery",
    ),
    HomeGirdItems(image: Appimages.stroesSvg, isoffer: true, title: "Stores"),
  ];
  static List<TrendingGirdItems> trendinggirditems = [
    TrendingGirdItems(
      image: Appimages.trendingimage,
      ratingandtime: "4.1  |  45 mins",
      storelocation: "(store location)  |  6.4 kms",
      subtile: "Sweets, North Indian",
      title: "Mithas Bhandar",
    ),
    TrendingGirdItems(
      image: Appimages.trendingimage,
      ratingandtime: "4.1  |  45 mins",
      storelocation: "(store location)  |  6.4 kms",
      subtile: "Sweets, North Indian",
      title: "Mithas Bhandar",
    ),
    TrendingGirdItems(
      image: Appimages.trendingimage,
      ratingandtime: "4.1  |  45 mins",
      storelocation: "(store location)  |  6.4 kms",
      subtile: "Sweets, North Indian",
      title: "Mithas Bhandar",
    ),
    TrendingGirdItems(
      image: Appimages.trendingimage,
      ratingandtime: "4.1  |  45 mins",
      storelocation: "(store location)  |  6.4 kms",
      subtile: "Sweets, North Indian",
      title: "Mithas Bhandar",
    ),
  ];
  static List<NearbyStoresListitems> nearbystoreslistitems = [
    NearbyStoresListitems(
      image: Appimages.nearbystores,
      title: "Freshly Baker",
      subtile: "Sweets, North Indian",
      siteno: "Site No - 1  |  6.4 kms",
      offer: "Upto 10% OFF",
      itemsavabile: "3400+ items available",
      minutes: "45 mins",
      rating: "4.1",
    ),
    NearbyStoresListitems(
      image: Appimages.nearbystores,
      title: "Freshly Baker",
      subtile: "Sweets, North Indian",
      siteno: "Site No - 1  |  6.4 kms",
      offer: "Upto 10% OFF",
      itemsavabile: "3400+ items available",
      minutes: "45 mins",
      rating: "4.1",
    ),
  ];
}

class HomeGirdItems {
  final bool isoffer;
  final String image;
  final String title;
  HomeGirdItems({
    required this.image,
    required this.isoffer,
    required this.title,
  });
}

class TrendingGirdItems {
  final String image;
  final String title;
  final String subtile;
  final String storelocation;
  final String ratingandtime;
  TrendingGirdItems({
    required this.image,
    required this.ratingandtime,
    required this.storelocation,
    required this.subtile,
    required this.title,
  });
}

class NearbyStoresListitems {
  final String image;
  final String title;
  final String subtile;
  final String siteno;
  final String offer;
  final String itemsavabile;
  final String rating;
  final String minutes;
  NearbyStoresListitems({
    required this.image,
    required this.title,
    required this.subtile,
    required this.siteno,
    required this.offer,
    required this.itemsavabile,
    required this.minutes,
    required this.rating,
  });
}
