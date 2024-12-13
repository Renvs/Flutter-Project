import 'package:flutter/material.dart';

double iconSize = 30;

CarList carList = CarList(cars: [
  Car(
    namaPerusahaan: "Chevrolet",
    namaMobil: "Corvette",
    harga: 10000000,
    images: [
      "corvette_front.png",
      "corvette_back.png",
      "interior1.png",
      "interior2.png",
      "corvette_front2.png",
    ],
    penawaran: [
      {Icon(Icons.bluetooth, size: iconSize): "Otomatis"},
      {Icon(Icons.airline_seat_individual_suite, size: iconSize): "4 kursi"},
      {Icon(Icons.pin_drop, size: iconSize): "6.4L"},
      {Icon(Icons.shutter_speed, size: iconSize): "5HP"},
      {Icon(Icons.invert_colors, size: iconSize): "Varian Warna"},
    ],
    spesifikasi: [
      {Icon(Icons.av_timer, size: iconSize): {"Jarak Tempuh": "14.2 km/l"}},
      {Icon(Icons.power, size: iconSize): {"Kapasitas Mesin": "3996 cc"}},
      {Icon(Icons.assignment_late, size: iconSize): {"BHP": "700"}},
      {Icon(Icons.account_balance_wallet, size: iconSize): {"DLL": "14.2 km/l"}},
      {Icon(Icons.cached, size: iconSize): {"DLL": "14.2 km/l"}},
    ],
    fitur: [
      {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
      {Icon(Icons.usb, size: iconSize): "Port USB"},
      {Icon(Icons.power_settings_new, size: iconSize): "Tanpa Kunci"},
      {Icon(Icons.android, size: iconSize): "Android Auto"},
      {Icon(Icons.ac_unit, size: iconSize): "AC"},
    ],
  ),
  Car(
    namaPerusahaan: "Lamborghini",
    namaMobil: "Aventador",
    harga: 20000000,
    images: [
      "lambo_front.png",
      "interior_lambo.png",
      "lambo_back.png",
    ],
    penawaran: [
      {Icon(Icons.bluetooth, size: iconSize): "Otomatis"},
      {Icon(Icons.bluetooth, size: iconSize): "4 kursi"},
      {Icon(Icons.bluetooth, size: iconSize): "6.4L"},
      {Icon(Icons.bluetooth, size: iconSize): "5HP"},
      {Icon(Icons.bluetooth, size: iconSize): "Varian Warna"},
    ],
    spesifikasi: [
      {Icon(Icons.bluetooth, size: iconSize): {"Jarak Tempuh(sampai)": "14.2 km/l"}},
      {Icon(Icons.bluetooth, size: iconSize): {"Mesin(sampai)": "3996 cc"}},
      {Icon(Icons.bluetooth, size: iconSize): {"BHP": "700"}},
      {Icon(Icons.bluetooth, size: iconSize): {"Spesifikasi Lainnya": "14.2 km/l"}},
      {Icon(Icons.bluetooth, size: iconSize): {"Spesifikasi Lainnya": "14.2 km/l"}},
    ],
    fitur: [
      {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
      {Icon(Icons.bluetooth, size: iconSize): "Port USB"},
      {Icon(Icons.bluetooth, size: iconSize): "Tanpa Kunci"},
      {Icon(Icons.bluetooth, size: iconSize): "Android Auto"},
      {Icon(Icons.bluetooth, size: iconSize): "AC"},
    ],
  ),
]);

class CarList {
  List<Car> cars;

  CarList({required this.cars});
}

class Car {
  String namaPerusahaan;
  String namaMobil;
  int harga;
  List<String> images;
  List<Map<Icon, String>> penawaran;
  List<Map<Icon, String>> fitur;
  List<Map<Icon, Map<String, String>>> spesifikasi;

  Car({
    required this.namaPerusahaan,
    required this.namaMobil,
    required this.harga,
    required this.images,
    required this.penawaran,
    required this.fitur,
    required this.spesifikasi,
  });
}

