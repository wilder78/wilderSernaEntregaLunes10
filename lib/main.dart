import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Punto de entrada principal
void main() => runApp(const MyApp());

/// Enum que define las pantallas
enum AppState {
  principal,
  pantalla1,
  pantalla2,
  pantalla3,
  pantalla4,
  pantalla5,
  pantalla6,
}

/// 🔹 Widget raíz
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Multi-Estado con Animaciones',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// 🔹 Pantalla principal con gestión de estados
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal>
    with TickerProviderStateMixin {
  AppState _estadoActual = AppState.principal;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat();

  void _cambiarEstado(AppState nuevoEstado) {
    setState(() => _estadoActual = nuevoEstado);
  }

  void _volverAlInicio() => _cambiarEstado(AppState.principal);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (_estadoActual) {
      AppState.principal => _buildPantallaPrincipal(),
      AppState.pantalla1 => _buildPantalla1(),
      AppState.pantalla2 => _buildPantalla2(),
      AppState.pantalla3 => _buildPantalla3(),
      AppState.pantalla4 => _buildPantalla4(),
      AppState.pantalla5 => _buildPantalla5(),
      AppState.pantalla6 => _buildPantalla6(),
    };
  }

  // ===========================================================================
  // PANTALLA PRINCIPAL
  // ===========================================================================
  Widget _buildPantallaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selecciona una pantalla',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _buildBoton(
                  "Pantalla 1",
                  Colors.blue,
                  () => _cambiarEstado(AppState.pantalla1),
                ),
                const SizedBox(height: 16),
                _buildBoton(
                  "Pantalla 2",
                  Colors.green,
                  () => _cambiarEstado(AppState.pantalla2),
                ),
                const SizedBox(height: 16),
                _buildBoton(
                  "Pantalla 3",
                  Colors.orange,
                  () => _cambiarEstado(AppState.pantalla3),
                ),
                const SizedBox(height: 16),
                _buildBoton(
                  "Pantalla 4",
                  Colors.indigo,
                  () => _cambiarEstado(AppState.pantalla4),
                ),
                const SizedBox(height: 16),
                _buildBoton(
                  "Pantalla 5",
                  Colors.teal,
                  () => _cambiarEstado(AppState.pantalla5),
                ),
                const SizedBox(height: 16),
                _buildBoton(
                  "Pantalla 6",
                  Colors.redAccent,
                  () => _cambiarEstado(AppState.pantalla6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBoton(String texto, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
      ),
      child: Text(texto, style: const TextStyle(fontSize: 18)),
    );
  }

  // ===========================================================================
  // PANTALLAS SIN ANIMACIÓN
  // ===========================================================================
  Widget _buildPantallaBase({
    required String titulo,
    required Color color,
    required String descripcion,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: color,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  descripcion,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _volverAlInicio,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver al Inicio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPantalla1() => _buildPantallaBase(
    titulo: 'Pantalla 1',
    color: Colors.blue,
    descripcion:
        'Esta es la primera pantalla sin animación. Ideal para mostrar contenido estático.',
  );

  Widget _buildPantalla2() => _buildPantallaBase(
    titulo: 'Pantalla 2',
    color: Colors.green,
    descripcion:
        'Aquí puedes mostrar información importante, formularios o datos del usuario.',
  );

  Widget _buildPantalla3() => _buildPantallaBase(
    titulo: 'Pantalla 3',
    color: Colors.orange,
    descripcion:
        'Pantalla sin animación donde puedes incluir texto, imágenes o listas simples.',
  );

  // ===========================================================================
  // PANTALLAS CON ANIMACIÓN
  // ===========================================================================
  Widget _buildPantalla4() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 4 - Rotación'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 80),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _volverAlInicio,
        icon: const Icon(Icons.arrow_back),
        label: const Text("Volver al Inicio"),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  Widget _buildPantalla5() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 5 - Escala'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 0.8 + 0.2 * math.sin(_controller.value * 2 * math.pi),
              child: child,
            );
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 80),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _volverAlInicio,
        icon: const Icon(Icons.arrow_back),
        label: const Text("Volver al Inicio"),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildPantalla6() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 6 - Movimiento'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final dx = math.sin(_controller.value * 2 * math.pi) * 100;
          return Transform.translate(offset: Offset(dx, 0), child: child);
        },
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.flight_takeoff,
              color: Colors.white,
              size: 80,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _volverAlInicio,
        icon: const Icon(Icons.arrow_back),
        label: const Text("Volver al Inicio"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
