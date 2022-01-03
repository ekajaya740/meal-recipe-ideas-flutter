import 'dart:io';

import 'package:http/http.dart' as http;


class HTTPProvider {
  Future<String> httpAccess({required String uri}) async {
    // uri = this.uri;
    Uri _url = Uri.parse(uri);
    var _res = await http.get(_url);

    return _res.body;
  }
}
