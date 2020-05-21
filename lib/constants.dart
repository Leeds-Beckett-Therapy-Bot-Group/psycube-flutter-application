import 'package:flutter/material.dart';


const Color kPrimaryBlue = Color(0xFF33ccff);
const Color kAccentBlue = Color(0xFF99e6ff);


const TextStyle kHeaderText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontFamily: 'Baloo'

);

const TextStyle kSecondaryText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'Baloo'

);

const TextStyle kChatBotText = TextStyle(
  color: Color(0xFF005073),
  fontWeight: FontWeight.w500,
  fontFamily: 'Baloo'
);

const kInputDecoration = InputDecoration(
  hintText: 'value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);