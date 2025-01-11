import 'package:flutter/material.dart';

class RevestimientosServices extends StatelessWidget {
  const RevestimientosServices({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamaño de la pantalla
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context); // Vuelve a la pantalla anterior
            }
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildGeometricBackground(size), // Fondo geométrico
          _buildContent(context, size), // Contenido principal
        ],
      ),
    );
  }

  Widget _buildGeometricBackground(Size size) {
    return CustomPaint(
      painter: GeometricBackgroundPainter(),
      size: Size(size.width, size.height * 0.4), // Ajuste del fondo
    );
  }

  Widget _buildContent(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.12), // Espaciado superior
          _buildImageInWave(), // Imagen centrada arriba
          const SizedBox(height: 20),
          _buildHeaderText(), // Título con subrayado
          const SizedBox(height: 30),
          _buildButtons(context, size), // Botones de servicios
        ],
      ),
    );
  }

  Widget _buildImageInWave() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(250),
      child: Image.asset(
        'images/519158.jpg', // Imagen para esta pantalla
        height: 280,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          "REVESTIMIENTOS",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 4,
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

  Widget _buildButtons(BuildContext context, Size size) {
    final services = [
      {
        "text": "EMPASTADO EN MUROS",
        "icon": Icons.layers,
        "route": "/painting_damage",
      },
      {
        "text": "EMPASTADO EN LOZA (TECHO)",
        "icon": Icons.roofing,
        "route": "/painting_plaster",
      },
      {
        "text": "CORRECCIÓN DE GRIETAS",
        "icon": Icons.build,
        "route": "/painting_plaster",
      },
    ];

    return Column(
      children: services.map((service) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.015,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, service["route"] as String);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.05,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.width * 0.05),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  service["icon"] as IconData, // Ícono del servicio
                  size: 24,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    service["text"] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class GeometricBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 102, 103, 104),
          Color.fromARGB(255, 189, 190, 191),
          Color.fromARGB(255, 85, 92, 93)
        ],
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
