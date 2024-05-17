import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void ShowsnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
