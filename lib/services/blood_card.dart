import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BloodCard with ChangeNotifier {
  final String id;
  final String name;
  final String nameInMalayam;
  final String bloodGroup;
  final String gender;
  final double age;
  final int contact;
  BloodCard({
    required this.gender,
    required this.contact,
    required this.id,
    required this.name,
    required this.nameInMalayam,
    required this.bloodGroup,
    required this.age,
  });
}
