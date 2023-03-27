import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension SizeExtension on Size {
  bool get isMobile => getDeviceType(this) == DeviceScreenType.mobile;
}
