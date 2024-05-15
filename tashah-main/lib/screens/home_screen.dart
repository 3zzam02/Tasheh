
/*import 'package:firebase_signin/screens/signin_screen.dart';*/
import 'package:flutter/material.dart';
import 'package:tasheh/screens/signin_screen.dart';
import 'package:tasheh/screens/signup_screen.dart';
import 'package:tasheh/utils/color_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "GET STARTED",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("701c1c"),
                hexStringToColor("4e1609"),
                hexStringToColor("480607")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 100,),

                  Container(

                    height: 320,
                    width: 1200,
                    decoration: const BoxDecoration(

                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/wlcmm.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text('Tasha is a dynamic application designed to assist individuals in seamlessly joining and participating in volunteer activities. This innovative app simplifies the process of engagement by connecting users with a diverse range of volunteer opportunities.'
                      , style: TextStyle(fontSize: 17.0 , color: Colors.white, ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.transparent,
                          // decoration: BoxDecoration(borderRadius: BorderRadius.all(2)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SignInScreen()));
                            },
                            child: Text(
                              'LOGIN',
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),

                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent, // Set the alpha value to 00 for transparency
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.lightBlue, // Set border color to blue
                                  width: 2.0, // Set border width
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.lightBlue,
                          // decoration: BoxDecoration(borderRadius: BorderRadius.all(2)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SignUpScreen()));
                              },
                            child: Text(
                              'SIGNUP',
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),

                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent, // Set the alpha value to 00 for transparency
                            ),
                          ),
                        ),
                      ),

                    ],
                  )

                ],

              ),

            ),
          )

      ),
    );
  }
}
