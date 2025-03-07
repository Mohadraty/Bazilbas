import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebFunction {
  PageController pageController = PageController();
  int currentPage = 0;
  // footer function
  void contactFaceBook() async {
    final Uri urlFaceBook =
        Uri.parse('https://www.facebook.com/profile.php?id=61567379603482');
    if (await canLaunchUrl(urlFaceBook)) {
      await launchUrl(urlFaceBook);
    } else {}
  }

  void contactInstagram() async {
    final Uri urlInstagram = Uri.parse(
        'https://www.instagram.com/bazilbas.store/?fbclid=IwY2xjawGsoeNleHRuA2FlbQIxMAABHXcbcmpcfzdwkMQnRDcvIZ6SAAxh0mBRrIvNY2RKvlzmJarzqh0K9sSyog_aem_a401F6vnBXzkdXYBLoGJHw');

    if (await canLaunchUrl(urlInstagram)) {
      await launchUrl(urlInstagram);
    } else {}
  }

  void contactPhone() async {
    String phoneNumber = "+201008158334";
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {}
  }

  void contactHopaQuaswer() async {
    final Uri urlHopaQuaswer =
        Uri.parse('https://www.facebook.com/profile.php?id=61568711070477');
    if (await canLaunchUrl(urlHopaQuaswer)) {
      await launchUrl(urlHopaQuaswer);
    } else {
      // print('Could not launch $url');
    }
  }
}

WebFunction webFunction = WebFunction();
