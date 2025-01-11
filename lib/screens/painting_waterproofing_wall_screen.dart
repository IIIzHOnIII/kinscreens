import 'package:flutter/material.dart';
import 'dart:io';

class WaterproofingWall extends StatefulWidget {
  const WaterproofingWall({Key? key}) : super(key: key);

  @override
  State<WaterproofingWall> createState() => _WaterproofingWallState();
}

class _WaterproofingWallState extends State<WaterproofingWall> {
  bool isAsfalticasChecked = false;
  bool isAcrilicasChecked = false;
  bool isCementososChecked = false;
  bool isElastomericosChecked = false;
  bool isMembranasChecked = false;
  bool isMembranasReforzadasChecked = false;
  bool isNanotecnologicosChecked = false;
  bool isTranspirablesChecked = false;
  File? _selectedImage;

  Future<void> _pickImage() async {
    // Aquí deberías usar un paquete como image_picker para seleccionar una imagen
    // Por ejemplo:
    // final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   setState(() {
    //     _selectedImage = File(pickedFile.path);
    //   });
    // }
  }

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
              'CARACTERÍSTICAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            _buildSurfaceSection(),
            const SizedBox(height: 20),
            _buildWaterproofingTypeSection(),
            const SizedBox(height: 20),
            _buildPhotoAndCommentsSection(),
            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSurfaceSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SUPERFICIE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          _buildTextField(hintText: 'LARGO:'),
          const SizedBox(height: 8),
          _buildTextField(hintText: 'ANCHO:'),
        ],
      ),
    );
  }

  Widget _buildWaterproofingTypeSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿QUÉ TIPO DE IMPERMEABILIZANTE?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          _buildCheckbox(
            title: 'Asfálticas',
            value: isAsfalticasChecked,
            onChanged: (value) {
              setState(() {
                isAsfalticasChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Acrílicas',
            value: isAcrilicasChecked,
            onChanged: (value) {
              setState(() {
                isAcrilicasChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Cementosos',
            value: isCementososChecked,
            onChanged: (value) {
              setState(() {
                isCementososChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Elastoméricos',
            value: isElastomericosChecked,
            onChanged: (value) {
              setState(() {
                isElastomericosChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Membranas',
            value: isMembranasChecked,
            onChanged: (value) {
              setState(() {
                isMembranasChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Membranas de Refuerzo',
            value: isMembranasReforzadasChecked,
            onChanged: (value) {
              setState(() {
                isMembranasReforzadasChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Nanotecnológicos',
            value: isNanotecnologicosChecked,
            onChanged: (value) {
              setState(() {
                isNanotecnologicosChecked = value!;
              });
            },
          ),
          _buildCheckbox(
            title: 'Transpirables',
            value: isTranspirablesChecked,
            onChanged: (value) {
              setState(() {
                isTranspirablesChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoAndCommentsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FOTOS Y COMENTARIOS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Escribe aquí...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.black38),
                onPressed: _pickImage,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _selectedImage != null
              ? Image.file(
                  _selectedImage!,
                  height: 100,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
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
        backgroundColor: Colors.black87,
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
      activeColor: Colors.black87,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

class GeometricBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.grey.shade400,
          Colors.grey.shade300,
          Colors.grey.shade200,
        ],
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
