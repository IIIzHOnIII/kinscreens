import 'package:flutter/material.dart';

class AirConditioningMaintenceCharacteristics extends StatefulWidget {
  const AirConditioningMaintenceCharacteristics({super.key});

  @override
  State<AirConditioningMaintenceCharacteristics> createState() =>
      _AirConditioningMaintenceCharacteristicsState();
}

class _AirConditioningMaintenceCharacteristicsState
    extends State<AirConditioningMaintenceCharacteristics> {
  // Controladores para los checkboxes
  final Map<String, bool> _capacityOptions = {
    "1 TON": false,
    "1.5 TON": false,
    "2 TON": false,
    "2.5 TON": false,
    "3 TON": false,
  };

  final Map<String, bool> _styleOptions = {
    "MINI-SPLIT": false,
    "PISO-TECHO": false,
  };

  final Map<String, bool> _heatingOptions = {
    "FRIO": false,
    "FRÍO Y CALOR": false,
  };

  final Map<String, bool> _systemOptions = {
    "STANDARD": false,
    "INTERTER": false,
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
          _buildContentWithImage(context),
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

  Widget _buildContentWithImage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80), // Espacio para la AppBar
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              'images/251965.jpg', // Ruta de la imagen específica
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          _buildHeaderText(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCompactCheckboxSection(
                  title: "CAPACIDAD:",
                  options: _capacityOptions,
                ),
                const SizedBox(height: 20),
                _buildCompactCheckboxSection(
                  title: "ESTILO:",
                  options: _styleOptions,
                ),
                const SizedBox(height: 20),
                _buildCompactCheckboxSection(
                  title: "TIPO DE CALEFACCIÓN:",
                  options: _heatingOptions,
                ),
                const SizedBox(height: 20),
                _buildCompactCheckboxSection(
                  title: "SISTEMA:",
                  options: _systemOptions,
                ),
                const SizedBox(height: 30),
                _buildSubmitButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          "SELECCIONE EL EQUIPO QUE TIENE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 250,
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
        Navigator.pushNamed(context, '/nextScreen'); // Ruta al presionar enviar
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
