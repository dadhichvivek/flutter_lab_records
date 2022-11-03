import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/image_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        _launchUrl("https://www.instagram.com/dadhich517/");
        break;
      case 1:
        _launchUrl("https://github.com/dadhichvivek/");
        break;
      case 2:
        _launchUrl("https://facebook.com/");
        break;
      default:
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List images = [
      "https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/3737018/pexels-photo-3737018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/4386404/pexels-photo-4386404.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/7004697/pexels-photo-7004697.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/5603660/pexels-photo-5603660.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/3794359/pexels-photo-3794359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/4022082/pexels-photo-4022082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(
        child: Center(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePage(
                        title: "Video Player",
                        link: images[itemIndex],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Image.network(
                    images[itemIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(height: 400.0),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.instagram),
            label: "Instagram",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.github),
            label: "GitHub",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.facebook),
            label: "FaceBook",
          ),
        ],
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
