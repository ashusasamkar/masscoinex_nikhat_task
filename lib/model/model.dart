import 'dart:io';
import 'dart:ui';

class Model{
  File _image;

  File get image => _image;

  set image(value) {
    _image = value;
  }
}