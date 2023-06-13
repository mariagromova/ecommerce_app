import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List _bannerImage = [];

  getBanners() {
    return _firestore
        .collection("banners")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              color: elementsColor, borderRadius: BorderRadius.circular(10)),
          child: PageView.builder(
              itemCount: _bannerImage.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: _bannerImage[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer(
                      duration: Duration(seconds: 10),

                      interval: Duration(seconds: 10),

                      color: Colors.white,

                      colorOpacity: 0.3,

                      enabled: true,
                      // This is the default value
                      direction: ShimmerDirection.fromLTRB(),

                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              })),
    );
  }
}
