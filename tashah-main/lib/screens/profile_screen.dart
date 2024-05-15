import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/reusable_widgets/reusable_widget.dart';
//import 'package:tasheh/screens/home_screen.dart';
import 'package:tasheh/screens/upload_screen.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'Profile : ',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/prof_img.jpg'),
                ),
                const SizedBox(height: 20),
                itemProfile('Name : ', 'UserName', CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile(
                    'Phone : ', 'UserPhoneNumber', CupertinoIcons.phone),
                const SizedBox(height: 10),
                itemProfile(
                    'Address : ', 'UserAdress', CupertinoIcons.location),
                const SizedBox(height: 10),
                itemProfile('Email: ', 'UserEmail', CupertinoIcons.mail),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: firebaseUIButton(context, 'Edit profile', () {},
                      const Color.fromRGBO(72, 6, 7, 1)),
                ),
              ],
            ),
          )),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromRGBO(72, 6, 7, 0.8),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
