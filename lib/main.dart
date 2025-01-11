import 'package:flutter/material.dart';
import 'package:flutterscreens/screens/electric_lighting.dart';
import 'package:flutterscreens/screens/home_screen.dart';
import 'package:flutterscreens/screens/electric_services_screen.dart';
import 'package:flutterscreens/screens/electric_maintenance_services.dart';
import 'package:flutterscreens/screens/electric_installation.dart';
import 'package:flutterscreens/screens/contact_form_screen.dart';
import 'package:flutterscreens/screens/air_conditioning_services.dart';
import 'package:flutterscreens/screens/air_conditioning_maintenance_screen.dart';
import 'package:flutterscreens/screens/air_conditioning_maintence_characteristics.dart';
import 'package:flutterscreens/screens/air_conditioning_installation_screen.dart';
import 'package:flutterscreens/screens/painting_plaster_screen.dart';
import 'package:flutterscreens/screens/painting_services_screen.dart';
import 'package:flutterscreens/screens/painting_application_screen.dart';
import 'package:flutterscreens/screens/painting_waterproofing_services_screen.dart';
import 'package:flutterscreens/screens/painting_coating_screen.dart';
import 'package:flutterscreens/screens/painting_wall_screen.dart';
import 'package:flutterscreens/screens/painting_waterproofing_wall_screen.dart';
import 'package:flutterscreens/screens/painting_damage_screen.dart';
// Importa más pantallas conforme se agreguen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App con Diseño Mejorado',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/electric_services': (context) => const ElectricServicesScreen(),
        '/electric_maintenance': (context) =>
            const ElectricMaintenanceServices(),
        '/electric_installation': (context) => const ElectricInstallation(),
        '/electric_lighting': (context) => const ElectricLighting(),
        '/contact_form': (context) => const ContactFormScreen(),
        '/air_conditioning_services': (context) =>
            const AirConditioningServices(),
        '/air_conditioning_maintenance': (context) =>
            const AirConditioningMaintenance(),
        '/air_conditioning_maintenance_characteristics': (context) =>
            const AirConditioningMaintenceCharacteristics(),
        '/air_conditioning_installation': (context) =>
            const AirConditioningInstallation(),
        '/painting_services': (context) => const PaintingServices(),
        '/painting_application': (context) => const PaintingApplication(),
        '/painting_waterproofing': (context) => const WaterproofingServices(),
        '/painting_walls': (context) => const WallScreen(),
        '/painting_coatings': (context) => const RevestimientosServices(),
        '/painting_waterproofing_wall_screen': (context) =>
            const WaterproofingWall(),
        '/painting_damage': (context) => const DamageScreen(),
        '/painting_plaster': (context) => const PlasterScreen(),

        // Define más rutas conforme agregues pantallas
      },
    );
  }
}

// Pantalla de Placeholder para rutas futuras
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Pantalla: $title",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
