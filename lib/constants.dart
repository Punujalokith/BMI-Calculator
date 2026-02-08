import 'package:flutter/material.dart';

const kTileColor = Color(0xFF1D1F33);
const kSelectedTileColor = Color.fromARGB(255, 29, 31, 40);
const kInactiveTextColor = Color(0xFF8D8E98);
const kActiveTextColor = Color(0xFFFFFFFF);
const kBackgroundColor = Color(0xFF090C20);
const kButtonColor = Color(0xFFEC1356);
const kScaleButtonColor = Color(0xFF292A49);



final BoxDecoration kTileBorderDecoration = BoxDecoration(
  color: kTileColor,
  borderRadius: BorderRadius.circular(5),
);

final BoxDecoration kSelectedTileBorderDecoration = BoxDecoration(
  color: kSelectedTileColor,
  borderRadius: BorderRadius.circular(5),
);