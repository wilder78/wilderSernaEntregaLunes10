# 📱 App Multi-Estado - Proyecto Educativo Flutter

Un proyecto educativo de Flutter diseñado para enseñar los fundamentos del **manejo de estados** y la **arquitectura de aplicaciones móviles** a estudiantes de programación.

## 📖 Descripción del Proyecto

Esta aplicación es un ejemplo práctico y completamente comentado que demuestra cómo gestionar múltiples estados/pantallas en una aplicación Flutter sin usar navegación compleja (Navigator). Es ideal para estudiantes que están dando sus primeros pasos en el desarrollo móvil con Flutter.

### ✨ ¿Qué hace esta aplicación?

La app muestra una **pantalla principal con 3 botones de colores**:
- 🔵 **Botón Azul** → Lleva a la Pantalla 1
- 🟢 **Botón Verde** → Lleva a la Pantalla 2  
- 🟠 **Botón Naranja** → Lleva a la Pantalla 3

Cada pantalla secundaria contiene:
- Un título de bienvenida
- Un contenedor decorado con información
- Un botón para volver al inicio

---

## 🎯 Objetivos Educativos

Este proyecto está diseñado para que aprendas:

### 1. **Manejo de Estados en Flutter**
- ✅ Diferencia entre `StatelessWidget` y `StatefulWidget`
- ✅ Uso de `setState()` para actualizar la interfaz
- ✅ Gestión de estados locales con variables privadas
- ✅ Uso de enumeraciones (`enum`) para estados finitos

### 2. **Widgets Fundamentales**
- ✅ `Scaffold` - Estructura básica de una pantalla
- ✅ `AppBar` - Barra superior de navegación
- ✅ `Column` y `Row` - Layouts verticales y horizontales
- ✅ `Container` - Decoración y espaciado
- ✅ `ElevatedButton` - Botones interactivos
- ✅ `Text` - Visualización de texto
- ✅ `Padding` y `SizedBox` - Gestión de espacios

### 3. **Diseño y Estilización**
- ✅ Material Design 3
- ✅ Esquemas de colores temáticos
- ✅ Bordes redondeados y sombras
- ✅ Tipografía y estilos de texto
- ✅ Responsive design básico

### 4. **Buenas Prácticas**
- ✅ Código limpio y organizado
- ✅ Comentarios explicativos en español
- ✅ Uso de `const` para optimización
- ✅ Separación de responsabilidades
- ✅ Nombres descriptivos para variables y métodos

---

## 🛠️ Tecnologías Utilizadas

- **Flutter**: ^3.9.2
- **Dart**: ^3.9.2
- **Material Design 3**: UI moderna y accesible

---

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

1. **Flutter SDK** (versión 3.9.2 o superior)
   - [Guía de instalación oficial](https://docs.flutter.dev/get-started/install)

2. **Editor de código** (uno de estos):
   - [Visual Studio Code](https://code.visualstudio.com/) con la extensión de Flutter
   - [Android Studio](https://developer.android.com/studio) con plugin de Flutter
   - [IntelliJ IDEA](https://www.jetbrains.com/idea/)

3. **Emulador o dispositivo físico**:
   - Android: Android Emulator o dispositivo con USB debugging
   - iOS: Simulador de iOS (solo en macOS) o dispositivo físico
   - Chrome: Para versión web

4. **Git**: Para clonar el repositorio
   ```bash
   git --version
   ```

---

## 🚀 Instalación y Ejecución

### 1. Clonar el Repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd flutter_application_3
```

### 2. Instalar Dependencias

```bash
flutter pub get
```

### 3. Verificar la Instalación de Flutter

```bash
flutter doctor
```

Este comando te mostrará si tienes todo configurado correctamente. Resuelve cualquier problema que aparezca marcado con ❌.

### 4. Conectar un Dispositivo

**Opción A - Emulador Android:**
```bash
# Listar emuladores disponibles
flutter emulators

# Iniciar un emulador
flutter emulators --launch <emulator_id>
```

**Opción B - Simulador iOS (solo macOS):**
```bash
open -a Simulator
```

**Opción C - Navegador Chrome:**
```bash
# No necesitas iniciar nada, Flutter lo hará automáticamente
```

### 5. Verificar Dispositivos Conectados

```bash
flutter devices
```

### 6. Ejecutar la Aplicación

```bash
# Ejecutar en el dispositivo conectado
flutter run

# O especificar un dispositivo
flutter run -d chrome           # Para web
flutter run -d <device_id>      # Para un dispositivo específico
```

**Atajos útiles durante la ejecución:**
- `r` → Hot reload (recarga rápida)
- `R` → Hot restart (reinicio completo)
- `q` → Salir

---

## 📁 Estructura del Proyecto

```
flutter_application_3/
│
├── lib/
│   └── main.dart                # Archivo principal con toda la lógica
│
├── android/                     # Configuración específica de Android
├── ios/                         # Configuración específica de iOS
├── web/                         # Configuración para versión web
├── windows/                     # Configuración para Windows
├── linux/                       # Configuración para Linux
├── macos/                       # Configuración para macOS
│
├── pubspec.yaml                 # Dependencias y configuración del proyecto
├── pubspec.lock                 # Versiones bloqueadas de dependencias
├── analysis_options.yaml        # Reglas de análisis estático
└── README.md                    # Este archivo
```

---

## 🧩 Estructura del Código (main.dart)

El archivo `lib/main.dart` está organizado de la siguiente manera:

### 1. **Punto de Entrada**
```dart
void main() => runApp(const MyApp());
```

### 2. **Enumeración de Estados**
```dart
enum AppState {
  principal,  // Pantalla con los 3 botones
  pantalla1,  // Primera pantalla secundaria
  pantalla2,  // Segunda pantalla secundaria
  pantalla3,  // Tercera pantalla secundaria
}
```

### 3. **Widget Raíz (MyApp)**
- `StatelessWidget` que configura el tema de la app
- Define Material Design 3
- Establece colores base

### 4. **Widget Principal (PaginaPrincipal)**
- `StatefulWidget` que gestiona el estado actual
- Contiene la variable `_estadoActual`
- Métodos para cambiar entre estados

### 5. **Métodos de Construcción**
- `_buildPantallaPrincipal()` → Scaffold con 3 botones
- `_buildPantalla1()` → Scaffold del estado 1 (azul)
- `_buildPantalla2()` → Scaffold del estado 2 (verde)
- `_buildPantalla3()` → Scaffold del estado 3 (naranja)

---

## 🎨 Flujo de la Aplicación

```
┌─────────────────────┐
│  PANTALLA PRINCIPAL │
│                     │
│   ┌──────────────┐  │
│   │ Ir Pantalla 1│──┼──┐
│   └──────────────┘  │  │
│   ┌──────────────┐  │  │    ┌─────────────┐
│   │ Ir Pantalla 2│──┼──┼───>│ PANTALLA 1  │
│   └──────────────┘  │  │    │  (Azul)     │
│   ┌──────────────┐  │  │    │             │
│   │ Ir Pantalla 3│──┼──┘    │ [Volver]────┼──┐
│   └──────────────┘  │       └─────────────┘  │
└─────────────────────┘                        │
         ▲                                     │
         │                                     │
         └─────────────────────────────────────┘
```

**Funcionamiento:**
1. La app inicia en la **Pantalla Principal**
2. Al presionar un botón, `setState()` cambia `_estadoActual`
3. Flutter reconstruye la UI mostrando la nueva pantalla
4. El botón "Volver" regresa al estado principal

---

## 🔧 Cómo Modificar y Experimentar

### Ejercicio 1: Agregar una Cuarta Pantalla

1. **Agrega un nuevo estado al enum:**
```dart
enum AppState {
  principal,
  pantalla1,
  pantalla2,
  pantalla3,
  pantalla4,  // ← Nuevo estado
}
```

2. **Crea un nuevo botón en `_buildPantallaPrincipal()`:**
```dart
ElevatedButton(
  onPressed: () => _cambiarEstado(AppState.pantalla4),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
  ),
  child: const Text('Ir a Pantalla 4'),
),
```

3. **Agrega el caso en el switch:**
```dart
return switch (_estadoActual) {
  AppState.principal => _buildPantallaPrincipal(),
  AppState.pantalla1 => _buildPantalla1(),
  AppState.pantalla2 => _buildPantalla2(),
  AppState.pantalla3 => _buildPantalla3(),
  AppState.pantalla4 => _buildPantalla4(),  // ← Nuevo
};
```

4. **Crea el método `_buildPantalla4()`:**
```dart
Widget _buildPantalla4() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Pantalla 4'),
      backgroundColor: Colors.purple,
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: _volverAlInicio,
        child: const Text('Volver'),
      ),
    ),
  );
}
```

### Ejercicio 2: Cambiar Colores y Estilos

- Modifica el `seedColor` en `MyApp`:
```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
```

- Cambia los colores de los botones
- Ajusta tamaños de fuente
- Modifica los bordes redondeados

### Ejercicio 3: Agregar Imágenes

1. Crea una carpeta `assets/images/` en la raíz
2. Agrega imágenes a la carpeta
3. Actualiza `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```
4. Usa `Image.asset()` en tus pantallas

### Ejercicio 4: Agregar un Contador

Agrega un contador en cada pantalla que cuente cuántas veces la has visitado:

```dart
int _contadorPantalla1 = 0;

// En _buildPantalla1()
Text('Visitas: $_contadorPantalla1'),
```

---

## 📚 Conceptos Clave Explicados

### 🔹 ¿Qué es un Estado?

En Flutter, el **estado** es cualquier dato que puede cambiar durante el ciclo de vida de un widget. Cuando el estado cambia, Flutter reconstruye la UI automáticamente.

**Ejemplo en esta app:**
- La variable `_estadoActual` es el estado
- Cuando cambia, la pantalla visible cambia

### 🔹 ¿Por qué usar `setState()`?

`setState()` le dice a Flutter: *"Hey, algo cambió, necesitas redibujar este widget"*. Sin `setState()`, los cambios en las variables no se reflejarían en la pantalla.

```dart
void _cambiarEstado(AppState nuevoEstado) {
  setState(() {
    _estadoActual = nuevoEstado;  // Flutter redibuja después de esto
  });
}
```

### 🔹 StatelessWidget vs StatefulWidget

| StatelessWidget | StatefulWidget |
|----------------|----------------|
| No cambia después de crearse | Puede cambiar durante su vida |
| Más eficiente | Usa más memoria |
| Usa `const` siempre que sea posible | Tiene una clase State asociada |
| Ejemplo: `MyApp` | Ejemplo: `PaginaPrincipal` |

### 🔹 ¿Qué es un Widget?

Todo en Flutter es un widget. Los widgets son como bloques de construcción:
- Un botón es un widget
- Un texto es un widget
- Una columna que organiza otros widgets... ¡también es un widget!

---

## 🐛 Problemas Comunes y Soluciones

### Error: "Flutter SDK not found"
**Solución:** Asegúrate de tener Flutter en tu PATH
```bash
export PATH="$PATH:`pwd`/flutter/bin"  # macOS/Linux
```

### Error: "No devices found"
**Solución:** 
- Abre un emulador/simulador
- Conecta un dispositivo físico con USB debugging
- Usa Chrome: `flutter run -d chrome`

### Error al hacer Hot Reload
**Solución:** 
- Usa Hot Restart (`R`) en lugar de Hot Reload (`r`)
- Algunos cambios requieren reiniciar completamente

### Los cambios no se reflejan
**Solución:**
- ¿Usaste `setState()`?
- ¿Guardaste el archivo?
- Prueba con Hot Restart

---

## 📖 Recursos de Aprendizaje

### Documentación Oficial
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Widget Catalog](https://docs.flutter.dev/ui/widgets)

### Tutoriales Recomendados
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)

### Conceptos para Continuar
1. **Navegación con Navigator** - Para apps multi-pantalla reales
2. **State Management** - Provider, Bloc, Riverpod
3. **APIs y Backend** - http, dio
4. **Bases de datos locales** - sqflite, hive
5. **Firebase** - Autenticación y base de datos en la nube

---

## 🤝 Contribuciones

Este es un proyecto educativo. Si encuentras formas de mejorarlo o tienes sugerencias:

1. Haz un fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/mejora-educativa`)
3. Commit tus cambios (`git commit -m 'Agrega explicación de X concepto'`)
4. Push a la rama (`git push origin feature/mejora-educativa`)
5. Abre un Pull Request

---

## 📝 Licencia

Este proyecto es de código abierto y está disponible para fines educativos.

---

## 👨‍🏫 Para Instructores

Este proyecto puede usarse como:
- ✅ Material de clase para enseñar estados en Flutter
- ✅ Base para ejercicios prácticos
- ✅ Ejemplo de código limpio y documentado
- ✅ Punto de partida para proyectos estudiantiles

### Sugerencias de Ejercicios:
1. Pedir a los estudiantes que agreguen más pantallas
2. Implementar un contador global que persista entre pantallas
3. Agregar validación de formularios en alguna pantalla
4. Implementar animaciones entre cambios de estado
5. Convertir la app para usar Navigator en lugar de estados

---

## ❓ Preguntas Frecuentes

**P: ¿Puedo usar esto en un proyecto real?**  
R: Este es un ejemplo educativo. Para apps reales, se recomienda usar Navigator para navegación entre pantallas.

**P: ¿Por qué no usar Navigator.push()?**  
R: Para mantener el ejemplo simple y enfocado en el concepto de estado. Navigator es el siguiente paso después de dominar esto.

**P: ¿Funciona en iOS, Android y Web?**  
R: Sí, Flutter es multiplataforma. El mismo código funciona en todas las plataformas.

**P: ¿Cómo agrego más funcionalidades?**  
R: Empieza con pequeños cambios (colores, textos) y luego avanza a funcionalidades más complejas (formularios, imágenes, etc.)

---

## 📧 Contacto y Soporte

Si tienes preguntas o necesitas ayuda:
- 📖 Revisa la [documentación oficial de Flutter](https://docs.flutter.dev/)
- 💬 Únete a la [comunidad de Flutter en español](https://flutter.dev/community)
- 🐛 Reporta problemas en la sección de Issues del repositorio

---

**¡Feliz aprendizaje! 🚀**

Recuerda: La mejor manera de aprender Flutter es experimentando y construyendo cosas. No tengas miedo de romper el código, ¡siempre puedes volver a clonarlo!
