import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sep/pages/details.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Map map = {
    'status': 'reject',
    'status code': 404,
    'homePage': "Home Page",
    'homePage': "الصفحة الرئيسية"
  };

  //List nums = [1, 2, 3, 4, 5];

  Widget svg = SvgPicture.asset(
    'assets/images/clip-icon.svg',
    color: Colors.red,
    width: 50,
  );

  Color color = Colors.black;

  String tfValue = "TF VAlue";

  TextEditingController tfController = TextEditingController();
  TextEditingController tfController2 = TextEditingController();
  TextEditingController tfController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(map['status']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [],
        title: Text("Home Page"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tfController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "Enter Your Name",
                suffixIcon: Icon(Icons.person),
                prefixIcon: Icon(Icons.lock),
              ),
              onChanged: (value) {
                print(value);
                setState(() {
                  tfValue = value;
                });
              },
              onTap: () {
                print("Tapped!");
              },
              onEditingComplete: () {
                print("Complete");
              },
              onSubmitted: (value) {
                print("onSubmitted $value");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tfController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tfController3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (tfController2.text.isEmpty || tfController3.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please Fill Email and Password"),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: "Press",
                    onPressed: () {
                      print("Press");
                    },
                  ),
                ));
              } else {
                print(tfController.text);
                print(tfController2.text);
                print(tfController3.text);
              }
            },
            child: Text("Login"),
          ),
          Text(tfValue),
          Text(tfController.text),
          InkWell(
            onTap: () {
              navigateToDetailsPage("AHmad");
            },
            child: svg,
          ),
          InkWell(
            onTap: () {
              navigateToDetailsPage("Omar");
              print("RED");
              setState(() {
                if (color == Colors.black) {
                  color = Colors.red;
                } else if (color == Colors.red) {
                  color = Colors.black;
                }
              });
            },
            child: Icon(
              Icons.access_time_outlined,
              color: color,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 3),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.network(
                    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
                    fit: BoxFit.fill,
                  );
                },
              );
            }).toList(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  bool isAssetImage(String image) {
    return image.startsWith("assets");
  }

  void navigateToDetailsPage(name) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DetailsPage(
          name: name,
        ),
      ),
    );
  }
}
