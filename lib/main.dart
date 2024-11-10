import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List images = [
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
    "assets/images/image.jpg",
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
    "assets/images/image.jpg",
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
    "assets/images/image.jpg",
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
    "assets/images/image.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [],
        title: Text("Home Page"),
      ),
      body: ListView(
        children: [
          Image.network(
            "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          Image.network(
            "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.network(
                "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 10,
              ),
              Image.network(
                "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.network(
            "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/image.jpg",
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Image.asset(
                "assets/images/image.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
              Image.asset(
                "assets/images/image.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
              Image.asset(
                "assets/images/image.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < images.length; i++) Text(images[i]),
              Image.asset(
                "assets/images/image.jpg",
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return isAssetImage(images[index])
                  ? Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        images[index],
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Image.network(
                      images[index],
                      height: 100,
                      fit: BoxFit.fill,
                    );
            },
            itemCount: images.length,
          ),
          CachedNetworkImage(
            imageUrl:
                "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
          ),
        ],
      ),
    );
  }

  bool isAssetImage(String image) {
    return image.startsWith("assets");
  }
}
