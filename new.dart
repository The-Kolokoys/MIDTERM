import 'dart:async';
import 'dart:typed_data'; // Idagdag ito
import 'dart:ui' as ui; // Idagdag ito
import 'package:flutter/services.dart'; // Idagdag ito
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/constants/colors.dart';
import 'package:untitled2/features/home/home_tabs.dart';

// ... sa loob ng _TrackingScreenState ...

// Helper function para i-resize ang image asset
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer
      .asUint8List();
}

Future<void> _loadMarkerIcon() async {
  try {
    // I-set ang fixed width (halimbawa: 100 pixels)
    final Uint8List markerIcon = await getBytesFromAsset(
        'assets/motorbike.png', 100);

    setState(() {
      _motorbikeIcon = BitmapDescriptor.fromBytes(markerIcon);
    });
  } catch (e) {
    // Fallback kung sakaling may error sa pag-load ng asset
    debugPrint("Error loading motorbike icon: $e");
  }
}