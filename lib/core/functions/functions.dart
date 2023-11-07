import 'dart:convert';

import 'package:crypto/crypto.dart';

class Functions {
  String hashText({required String text}) {
    var bytes = utf8.encode(text);

    var digest = sha1.convert(bytes);

    return "$digest";
  }

  int hashInt({required String text}) {
    var bytes = utf8.encode(text);

    var digest = sha1.convert(bytes);

    return digest.hashCode;
  }
}
