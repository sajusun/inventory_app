import 'package:flutter/material.dart';

final btnLg= ElevatedButton.styleFrom(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    fixedSize: const Size(280, 45),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
);

final btnMd= ElevatedButton.styleFrom(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    fixedSize: const Size(180, 45),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
);

final btnSm= ElevatedButton.styleFrom(
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    fixedSize: const Size(100, 45),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
);
final btnDanger= ElevatedButton.styleFrom(
    backgroundColor: const Color(0xC5DC255C),
    foregroundColor: Colors.white,
    fixedSize: const Size(100, 45),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
);