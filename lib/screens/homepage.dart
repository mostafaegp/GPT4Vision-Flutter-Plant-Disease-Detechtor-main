import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gpt_vision_leaf_detect/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final apiService = ApiService();
  File? _selectedImage;
  String? diseaseName;
  String diseaseNameAr = '';
  bool detecting = false;
  bool firstScreen = true;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  detectDisease() async {
    setState(() {
      detecting = true;
    });
    try {
      diseaseName =
          await apiService.sendImageToGPT4Vision(image: _selectedImage!);
    } catch (error) {
      _showErrorSnackBar(error);
    } finally {
      setState(() {
        detecting = false;
      });
    }
  }



  void _showErrorSnackBar(Object error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error.toString()),
      backgroundColor: Colors.red,
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: firstScreen ? Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: (){
                  setState(() {
                    firstScreen = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade50,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset.fromDirection(10)
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),

                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("مرض الصدا الورقي", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),),
                      ),
                      const Spacer(),
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)), child: Image.asset("assets/images/rust.jpg", width: 120,  height: 120, fit: BoxFit.cover,))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  setState(() {
                    firstScreen = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade50,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset.fromDirection(10)
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),

                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("مرض Phoma", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),),
                      ),
                      const Spacer(),
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)), child: Image.asset("assets/images/phoma.jpg", width: 120,  height: 120, fit: BoxFit.cover,))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  setState(() {
                    firstScreen = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade50,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset.fromDirection(10)
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),

                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("مرض Cerscospora", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),),
                      ),
                      const Spacer(),
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)), child: Image.asset("assets/images/cercospora.jpg", width: 120,  height: 120, fit: BoxFit.cover,))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  setState(() {
                    firstScreen = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade50,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset.fromDirection(10)
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),

                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("مرض Miner", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),),
                      ),
                      const Spacer(),
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)), child: Image.asset("assets/images/miner.jpg", width: 120,  height: 120, fit: BoxFit.cover,))
                    ],
                  ),
                ),
              ),
              ]
          ),
        ),
      )
          : Column(
        children: <Widget>[
          const SizedBox(height: 20),
          _selectedImage == null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Icon(Icons.energy_savings_leaf_outlined, size: 60, color: themeColor,)
                  // Image.asset('assets/images/pick1.png'),
                )
              : Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

          if (_selectedImage != null)
            detecting
                ? SpinKitWave(
                    color: themeColor,
                    size: 30,
                  )
                : Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        // Set some horizontal and vertical padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        detectDisease();
                      },
                      child: const Text(
                        'فحص',
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                          fontSize: 16, // Set the font size
                          fontWeight:
                              FontWeight.bold, // Set the font weight to bold
                        ),
                      ),
                    ),
                  ),
          if (diseaseName != null)
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                        child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            displayFullTextOnTap: true,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TyperAnimatedText(
                                diseaseName!.trim().toLowerCase().contains("rust") ? "الصدا الورقي"
                                    : diseaseName!.trim().toLowerCase().contains("phoma") ? "مرض phoma"
                                    : diseaseName!.trim().toLowerCase().contains("cerscospora") ? "مرض cerscospora"
                                    : diseaseName!.trim().toLowerCase().contains("health") ? "ورقة سليمة"
                                    : diseaseName!.trim().toLowerCase().contains("miner") ? "مرض miner" : diseaseName!.trim(),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),

              ],
            ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0), // Bottom right corner
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    // Shadow color with some transparency
                    spreadRadius: 1,
                    // Extend the shadow to all sides equally
                    blurRadius: 5,
                    // Soften the shadow
                    offset: const Offset(2, 2), // Position of the shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedImage = null;
                        diseaseName = null;
                      });
                      _pickImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'اختر من الاستديو',
                          style: TextStyle(color: textColor),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.image,
                          color: textColor,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedImage = null;
                        diseaseName = null;
                      });
                      _pickImage(ImageSource.camera);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('اختر من الكاميرا',
                            style: TextStyle(color: textColor)),
                        const SizedBox(width: 10),
                        Icon(Icons.camera_alt, color: textColor)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
