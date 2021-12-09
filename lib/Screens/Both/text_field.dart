import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintName;
  final TextEditingController? controller;
  final IconData? iconType;
  final TextInputType? keyboardType;
  const CustomTextField({Key? key, this.hintName = '', this.iconType, this.keyboardType, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Icon(iconType),
          ),
          Container(
            width: 225,
            height: 50,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintName,
                hintStyle: TextStyle(fontFamily: "Lobster", fontWeight: FontWeight.bold, color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
