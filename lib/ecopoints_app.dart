import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'telas/inicio.dart';
import 'telas/mapa.dart';
import 'telas/recompensas.dart';
import 'telas/perfil.dart';
import 'telas/historico.dart';
import 'telas/configuracoes.dart';
import 'telas/estatisticas.dart';

void main() {
  runApp(const EcoPointsApp());
}

class EcoPointsApp extends StatefulWidget {
  const EcoPointsApp({super.key});

  @override
  State<EcoPointsApp> createState() => _EcoPointsAppState();
}

class _EcoPointsAppState extends State<EcoPointsApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPoints',
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: _themeMode,
      home: const EcoPointsHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  return ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: isDark ? const Color(0xFF7ED957) : const Color(0xFF2E7D32),
      onPrimary: isDark ? Colors.black : Colors.white,
      secondary: isDark ? const Color(0xFF3B82F6) : const Color(0xFF60A5FA),
      onSecondary: Colors.white,
      error: Colors.red.shade700,
      onError: Colors.white,
      background: isDark ? const Color(0xFF1A2B1A) : const Color(0xFFF6FFF6),
      onBackground: isDark ? Colors.white : const Color(0xFF2E2E2E),
      surface: isDark ? const Color(0xFF232323) : Colors.white,
      onSurface: isDark ? Colors.white : const Color(0xFF2E2E2E),
    ),
    textTheme: GoogleFonts.dmSansTextTheme(
      isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
    ).copyWith(
      headlineLarge: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      titleLarge: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: isDark
        ? const Color(0xFF1A2B1A)
        : Colors.white, // fundo branco puro no modo claro
    cardTheme: CardTheme(
      color: isDark ? const Color(0xFF232323) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? const Color(0xFF232323) : Colors.white,
      foregroundColor: isDark ? Colors.white : const Color(0xFF2E2E2E),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: isDark ? Colors.white : const Color(0xFF2E2E2E),
      ),
    ),
  );
}

class EcoPointsHome extends StatefulWidget {
  const EcoPointsHome({super.key});

  @override
  State<EcoPointsHome> createState() => _EcoPointsHomeState();
}

class _EcoPointsHomeState extends State<EcoPointsHome> {
  String activeTab = 'home';
  int userPoints = 1250;
  String userLevel = 'Reciclador Prata';
  bool notifications = true;
  bool darkMode = false;
  bool soundEnabled = true;
  bool locationEnabled = true;

  void setActiveTab(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  void setNotifications(bool value) {
    setState(() {
      notifications = value;
    });
  }

  void setDarkMode(bool value) {
    setState(() {
      darkMode = value;
      // Troca o tema do app
      final mode = value ? ThemeMode.dark : ThemeMode.light;
      final app = context.findAncestorStateOfType<_EcoPointsAppState>();
      if (app != null) app.setThemeMode(mode);
    });
  }

  void setSoundEnabled(bool value) {
    setState(() {
      soundEnabled = value;
    });
  }

  void setLocationEnabled(bool value) {
    setState(() {
      locationEnabled = value;
    });
  }

  Widget buildTabButton({
    required String id,
    required IconData icon,
    required String label,
    required bool isActive,
    required void Function(String) onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => onTap(id),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isActive ? colorScheme.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: isActive
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface.withOpacity(0.6),
              size: 22,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? colorScheme.primary
                  : colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (activeTab) {
      case 'home':
        return TelaInicio(
          userPoints: userPoints,
          onMenu: () {}, // Remove ação do menu no header
          onNotificacoes: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Notificações'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.bellOff,
                        size: 48,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5)),
                    const SizedBox(height: 16),
                    const Text('Nenhuma notificação no momento.',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          onPontosProximos: () {},
        );
      case 'rewards':
        return const TelaRecompensas();
      case 'map':
        return const TelaMapa();
      case 'scan':
        return const TelaScanner();
      case 'profile':
        return const TelaPerfil();
      case 'menu':
        return _buildMenuOptions(context);
      case 'history':
        return const TelaHistorico();
      case 'settings':
        return TelaConfiguracoes(
          notifications: notifications,
          darkMode: darkMode,
          soundEnabled: soundEnabled,
          locationEnabled: locationEnabled,
          onNotifications: setNotifications,
          onDarkMode: setDarkMode,
          onSoundEnabled: setSoundEnabled,
          onLocationEnabled: setLocationEnabled,
        );
      case 'stats':
        return const TelaEstatisticas();
      default:
        return TelaInicio(
          userPoints: userPoints,
          onMenu: () {},
          onNotificacoes: () {},
          onPontosProximos: () {},
        );
    }
  }

  Widget _buildMenuOptions(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: colorScheme.primary,
                child: Text('JD',
                    style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rafael Góes',
                      style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('$userPoints pontos',
                      style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurface.withOpacity(0.6))),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(LucideIcons.user, color: colorScheme.primary),
          title: const Text('Perfil'),
          onTap: () => setActiveTab('profile'),
        ),
        ListTile(
          leading: Icon(LucideIcons.barChart3, color: colorScheme.primary),
          title: const Text('Estatísticas'),
          onTap: () => setActiveTab('stats'),
        ),
        ListTile(
          leading: Icon(LucideIcons.history, color: colorScheme.primary),
          title: const Text('Histórico'),
          onTap: () => setActiveTab('history'),
        ),
        Divider(),
        ListTile(
          leading: Icon(LucideIcons.settings, color: colorScheme.primary),
          title: const Text('Configurações'),
          onTap: () => setActiveTab('settings'),
        ),
        ListTile(
          leading: Icon(LucideIcons.bell, color: colorScheme.primary),
          title: const Text('Notificações'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(LucideIcons.shield, color: colorScheme.primary),
          title: const Text('Privacidade'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(LucideIcons.helpCircle, color: colorScheme.primary),
          title: const Text('Central de Ajuda'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(LucideIcons.messageCircle, color: colorScheme.primary),
          title: const Text('Fale Conosco'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(LucideIcons.share2, color: colorScheme.primary),
          title: const Text('Compartilhar App'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(LucideIcons.logOut, color: Colors.red),
          title:
              const Text('Sair da Conta', style: TextStyle(color: Colors.red)),
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: _buildContent(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(
              top: BorderSide(color: colorScheme.outline.withOpacity(0.2))),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTabButton(
              id: 'home',
              icon: LucideIcons.home,
              label: 'Início',
              isActive: activeTab == 'home',
              onTap: setActiveTab,
            ),
            buildTabButton(
              id: 'map',
              icon: LucideIcons.mapPin,
              label: 'Mapa',
              isActive: activeTab == 'map',
              onTap: setActiveTab,
            ),
            buildTabButton(
              id: 'scan',
              icon: LucideIcons.qrCode,
              label: 'Escanear',
              isActive: activeTab == 'scan',
              onTap: setActiveTab,
            ),
            buildTabButton(
              id: 'rewards',
              icon: LucideIcons.gift,
              label: 'Recompensas',
              isActive: activeTab == 'rewards',
              onTap: setActiveTab,
            ),
            buildTabButton(
              id: 'menu',
              icon: LucideIcons.menu,
              label: 'Menu',
              isActive: activeTab == 'menu',
              onTap: setActiveTab,
            ),
          ],
        ),
      ),
    );
  }
}

class TelaScanner extends StatefulWidget {
  const TelaScanner({super.key});

  @override
  State<TelaScanner> createState() => _TelaScannerState();
}

class _TelaScannerState extends State<TelaScanner> {
  String? _qrCode;
  bool _found = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: (capture) {
            if (_found) return;
            final barcode = capture.barcodes.first;
            setState(() {
              _qrCode = barcode.rawValue;
              _found = true;
            });
            if (_qrCode != null) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('QR Code encontrado!'),
                  content: Text(_qrCode!),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() => _found = false);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Positioned(
          top: 48,
          left: 0,
          right: 0,
          child: Center(
            child: Text('Aponte para o QR Code',
                style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 8, color: Colors.black)])),
          ),
        ),
        Positioned(
          top: 48,
          left: 8,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 32),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Fechar',
          ),
        ),
      ],
    );
  }
}
