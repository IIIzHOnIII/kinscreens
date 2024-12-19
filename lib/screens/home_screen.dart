import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Perfil del usuario no definido aún"),
              ),
            );
          },
          icon: const Icon(Icons.person, color: Colors.black, size: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Menú no definido aún")),
              );
            },
            icon: const Icon(Icons.menu, color: Colors.black, size: 28),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Fondo difuminado con figuras geométricas
          _buildGeometricBackground(context),
          _buildImageInWave(), // Imagen en la parte ondulada
          _buildContent(context), // Contenido principal
        ],
      ),
    );
  }

  // Fondo difuminado con figuras geométricas
  Widget _buildGeometricBackground(BuildContext context) {
    return CustomPaint(
      painter: GeometricBackgroundPainter(),
      size: Size(MediaQuery.of(context).size.width,
          250), // Ajusta el tamaño según la pantalla
    );
  }

  // Imagen en la parte ondulada con bordes redondeados
  Widget _buildImageInWave() {
    return Positioned(
      top: 80, // Ajusta la posición según sea necesario
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(250), // Radio de los bordes
        child: Image.asset(
          'images/20945385.jpg', // Ruta de la imagen
          height: 250, // Ajusta la altura
          fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
        ),
      ),
    );
  }

  // Contenido principal
  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildHeaderText(),
        const SizedBox(height: 40),
        _buildButton(
            context, Icons.electrical_services, "INSTALACIONES ELÉCTRICAS"),
        const SizedBox(height: 20),
        _buildButton(
            context, Icons.videocam, "CCTV (INSTALACIÓN DE SEGURIDAD)"),
        const SizedBox(height: 20),
        _buildButton(context, Icons.ac_unit, "AIRE ACONDICIONADO"),
        const SizedBox(height: 20),
        _buildButton(context, Icons.format_paint, "PINTURA"),
        const SizedBox(height: 70),
      ],
    );
  }

  // Título principal
  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          "NECESITO UN SERVICIO...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 220,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Botones estilizados
  Widget _buildButton(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: () {
          // Lógica futura
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.grey.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.blueAccent),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fondo difuminado con figuras geométricas
class GeometricBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradientPaint = Paint()
      ..shader = LinearGradient(
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

    final circlePath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.75, size.height * 0.5), radius: 50))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width * 0.25, size.height * 0.75), radius: 40));

    canvas.drawPath(path, gradientPaint);
    canvas.drawPath(circlePath, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
