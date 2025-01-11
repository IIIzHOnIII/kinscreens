import 'package:flutter/material.dart';

class ElectricMaintenanceServices extends StatefulWidget {
  const ElectricMaintenanceServices({super.key});

  @override
  State<ElectricMaintenanceServices> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<ElectricMaintenanceServices> {
  // Estados de los checkboxes
  bool isOption1Checked = false;
  bool isOption2Checked = false;
  bool isOption3Checked = false;
  bool isOption4Checked = false;

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildGeometricBackground(context),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildGeometricBackground(BuildContext context) {
    return CustomPaint(
      painter: GeometricBackgroundPainter(),
      size: Size(MediaQuery.of(context).size.width, 300),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              '¿Qué está pasando?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'DIAGNÓSTICO PRELIMINAR',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Sección de checkboxes
            _buildCheckbox(
              title: 'Se bota la pastilla en la caja',
              value: isOption1Checked,
              onChanged: (value) {
                setState(() {
                  isOption1Checked = value!;
                });
              },
            ),
            _buildCheckbox(
              title:
                  'Variaciones de intensidad de la luz (más tenue cuando se enciende un aparato)',
              value: isOption2Checked,
              onChanged: (value) {
                setState(() {
                  isOption2Checked = value!;
                });
              },
            ),
            _buildCheckbox(
              title: 'Cortos circuitos',
              value: isOption3Checked,
              onChanged: (value) {
                setState(() {
                  isOption3Checked = value!;
                });
              },
            ),
            _buildCheckbox(
              title: 'No hay luz eléctrica',
              value: isOption4Checked,
              onChanged: (value) {
                setState(() {
                  isOption4Checked = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Campo de texto para descripción
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Describe lo que pasó o lo que observas...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildDescriptionField(),

            const SizedBox(height: 20),

            // Campo para el número de teléfono
            _buildPhoneField(),

            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
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

// Widget para checkbox
  Widget _buildCheckbox({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blueAccent,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  // Campo de descripción
  Widget _buildDescriptionField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Escribe aquí...',
        hintStyle: const TextStyle(color: Colors.black38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black54),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.black38),
          onPressed: () {
            // Acción futura: Adjuntar imagen
          },
        ),
      ),
    );
  }

  // Campo para el teléfono
  Widget _buildPhoneField() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: '+52',
              hintStyle: const TextStyle(color: Colors.black38),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 5,
          child: TextField(
            decoration: InputDecoration(
              hintText: '(xxx) xxx xxxx',
              hintStyle: const TextStyle(color: Colors.black38),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
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
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.15,
      size.width * 0.5,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.45,
      size.width,
      size.height * 0.3,
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
