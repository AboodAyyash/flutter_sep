import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sep/pages/details.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String deviceInfoData = '';

  List selectedImages = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map map2 = {'age': "", 'name': "", 'password': "", 'email': ""};

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', 20);

    await prefs.setBool('repeat', true);

    await prefs.setDouble('decimal', 2.5);

    await prefs.setString('action', 'Start 2');

    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun 23']);
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = 0;
    bool repeat = false;
    double decimal = 0.0;
    String action = '';
    List<String> items = [];

    print(counter);
    print(repeat);
    print(decimal);
    print(action);
    print(items);
    if (prefs.getInt('counter') != null) counter = prefs.getInt('counter')!;
    if (prefs.getBool('repeat') != null) repeat = prefs.getBool('repeat')!;
    if (prefs.getDouble('decimal') != null) decimal = prefs.getDouble('decimal')!;
    if (prefs.getString('action') != null) action = prefs.getString('action')!;
    if (prefs.getStringList('items') != null) items = prefs.getStringList('items')!;
    print("---------------------------------");
    print(counter);
    print(repeat);
    print(decimal);
    print(action);
    print(items);
  }

  @override
  Widget build(BuildContext context) {
    // print(map['status']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setData();
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              getData();
            },
            icon: Icon(Icons.data_array),
          ),
          IconButton(
            onPressed: () {
              getDEviceInfo();
            },
            icon: Icon(Icons.info),
          ),
          IconButton(
            onPressed: () {
              shareData();
            },
            icon: Icon(Icons.share),
          ),
        ],
        title: Text("Home Page"),
      ),
      body: ListView(
        children: [
          //email, password, userName, age
          // UpperCase, spical char , number , atleast 8 Chars = Password
          // valid Email = Email
          // atleast 1 char = userName
          // just numbers = age
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: tfController2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill";
                      } else if (value.length < 10) {
                        return 'please Fill VAlid Phone Number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: tfController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Done");
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
          Text(
            deviceInfoData,
            style: TextStyle(fontSize: 40),
          ),
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
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < selectedImages.length; i++)
                Container(
                  margin: EdgeInsets.all(10),
                  child: kIsWeb
                      ? Image.network(selectedImages[i])
                      : Image.memory(selectedImages[i]),
                ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage();
        },
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

  Future pickImage() async {
    /*   ImagePicker().pickImage(source: ImageSource.gallery).then((onValue) {
      print("test");
    }); */
    var results = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (results == null) {
      print("null");
      return;
    }
    setState(() {
      // Platform.isAndroid || Platform.isIOS
      if (kIsWeb) {
        selectedImages.add(results.path); // for Image.network
      } else {
        selectedImages
            .add(File(results.path).readAsBytes()); // for Image.memory
        //selectedImages.add(File(results.path)); // for Image.file
      }
    });

    print(results);
    print(selectedImages);
  }

  getDEviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      setState(() {
        deviceInfoData =
            webBrowserInfo.appName.toString(); // == webBrowserInfo.appName!
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');
    }
  }

  shareData() {
    Share.share('check out my website https://example.com');
  }
}
