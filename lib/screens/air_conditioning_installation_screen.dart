import 'package:flutter/material.dart';

class AirConditioningInstallation extends StatelessWidget {
  const AirConditioningInstallation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Vuelve hacia atrás
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
          'images/97826.jpg', // Nueva imagen asignada
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 150), // Ajusta la posición del título
        _buildHeaderText(),
        const SizedBox(height: 30), // Espaciado entre el título y botones
        _buildButtons(context),
        const SizedBox(
            height: 50), // Espaciado final para balancear la pantalla
      ],
    );
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          "INSTALACIÓN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 150,
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

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          context,
          Icons.check_circle_outline,
          'SÉ LO QUE NECESITO',
          '/air_conditioning_maintenance_characteristics',
        ),
        const SizedBox(height: 20), // Espaciado entre botones
        _buildButton(
          context,
          Icons.help_outline,
          'NO SÉ LO QUE NECESITO\nSOLICITO ASESORÍA TÉCNICA',
          '/need_consultation',
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.grey.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(vertical: 18),
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
