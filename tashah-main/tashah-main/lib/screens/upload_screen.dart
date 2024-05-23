import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasheh/resources/image_store_methods.dart';
import 'package:tasheh/utils/upload.dart';
import 'package:number_editing_controller/number_editing_controller.dart';

class up_screen extends StatefulWidget {
  const up_screen({super.key});

  /*
 , required this.title
 final String title;
*/

  @override
  State<up_screen> createState() => _up_screenState();
}

class _up_screenState extends State<up_screen> {
  Uint8List? _file;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final NumberEditingTextController _maxattendeesController =
      NumberEditingTextController.integer();

  bool _isLoading = false;
  void postImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await ImageStoreMethods().uploadPost(
        _titleController.text,
        _descriptionController.text,
        _locationController.text,
        _maxattendeesController.number,
        _file!,
      );
      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });
        showSnackBar('Posted', context);
        clearImage();
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  _imageSelect(BuildContext context) async {
    return _isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text('Select Image'),
                children: [
                  SimpleDialogOption(
                    padding: EdgeInsets.all(20),
                    child: Text('Take a Photo'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Uint8List file = await pickImage(
                        ImageSource.camera,
                      );
                      setState(() {
                        _file = file;
                      });
                    },
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.all(20),
                    child: Text('Choose From Gallery'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Uint8List file = await pickImage(
                        ImageSource.gallery,
                      );
                      setState(() {
                        _file = file;
                      });
                    },
                  ),
                  SimpleDialogOption(
                    padding: EdgeInsets.all(20),
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Add Event',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
      body: _file == null
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 155, 155, 155),
                    Color.fromARGB(255, 202, 202, 202),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 260),
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Color.fromRGBO(170, 50, 50, 0.514),
                      ),
                      onPressed: () => _imageSelect(context),
                      iconSize: 150,
                    ),
                    const Text(
                      'Add Event',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromRGBO(170, 50, 50, 0.514),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      _isLoading
                          ? const LinearProgressIndicator()
                          : const Padding(
                              padding: EdgeInsets.only(
                                top: 0,
                              ),
                            ),
                      const Divider(),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_file!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            //width: MediaQuery.of(context).size.width * 0.20,
                            child: TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                hintText: 'Write a Title : ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                hintText: 'Write a description : ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: _locationController,
                              decoration: const InputDecoration(
                                hintText: 'Write Location : (State , City) ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: _maxattendeesController,
                              decoration: const InputDecoration(
                                hintText: 'Maximum Number of Attendees',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: postImage, child: const Text("Post"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
