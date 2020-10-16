import 'package:flutter/material.dart';

import 'Pages/Home.dart';

void main() => runApp(
      MaterialApp(routes: {
        '/': (context) => Home(),
      }),
    );
