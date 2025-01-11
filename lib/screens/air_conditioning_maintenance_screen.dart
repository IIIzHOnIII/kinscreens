import 'package:flutter/material.dart';

class AirConditioningMaintenance extends StatefulWidget {
  const AirConditioningMaintenance({super.key});

  @override
  State<AirConditioningMaintenance> createState() =>
      _AirConditioningMaintenanceState();
}

class _AirConditioningMaintenanceState
    extends State<AirConditioningMaintenance> {
  // Controladores para los checkboxes
  final Map<String, bool> _maintenanceOptions = {
    "3-4 MESES": false,
    "5-6 MESES": false,
    "7-8 MESES": false,
    "9-10 MESES": false,
    "11-12 MESES": false,
  };

  final Map<String, bool> _gasOptions = {
    "10 Lb": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildGeometricBackground(context),
          _buildImageInWave(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildGeometricBackground(BuildContext context) {
    return CustomPaint(
      painter: GeometricBackgroundPainter(),
      size: Size(MediaQuery.of(context).size.width, 250),
    );
  }

  Widget _buildImageInWave() {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(250),
        child: Image.asset(
          'images/614561.jpg', // Ruta de la imagen de fondo
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height:
                    290), // Ajustado para colocar el subtítulo fuera de la imagen
            _buildHeaderText(),
            const SizedBox(height: 20),
            _buildCompactCheckboxSection(
              title: "ÚLTIMA FECHA DE MANTENIMIENTO:",
              options: _maintenanceOptions,
            ),
            const SizedBox(height: 20),
            _buildCompactCheckboxSection(
              title: "GAS-RECARGA",
              options: _gasOptions,
            ),
            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          "MANTENIMIENTO",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 150,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompactCheckboxSection({
    required String title,
    required Map<String, bool> options,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: options.keys.map((key) {
              return CheckboxListTile(
                dense: true, // Hace más compacto el checkbox
                contentPadding: EdgeInsets.zero,
                title: Text(
                  key,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                value: options[key],
                onChanged: (bool? value) {
                  setState(() {
                    options[key] = value ?? false;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
            context, '/air_conditioning_maintenance_characteristics');

        final selectedMaintenance = _maintenanceOptions.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();
        final selectedGas = _gasOptions.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

        print('Mantenimiento seleccionado: $selectedMaintenance');
        print('Gas seleccionado: $selectedGas');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Datos enviados correctamente."),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: const Text(
        "ENVIAR",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class GeometricBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlue, Colors.cyan],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.3,
      size.width,
      size.height * 0.2,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
