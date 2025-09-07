import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaConfiguracoes extends StatelessWidget {
  final bool notifications;
  final bool darkMode;
  final bool soundEnabled;
  final bool locationEnabled;
  final ValueChanged<bool> onNotifications;
  final ValueChanged<bool> onDarkMode;
  final ValueChanged<bool> onSoundEnabled;
  final ValueChanged<bool> onLocationEnabled;

  const TelaConfiguracoes({
    super.key,
    required this.notifications,
    required this.darkMode,
    required this.soundEnabled,
    required this.locationEnabled,
    required this.onNotifications,
    required this.onDarkMode,
    required this.onSoundEnabled,
    required this.onLocationEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Configurações',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Personalize sua experiência',
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        ListTile(
          leading: Icon(LucideIcons.bell, color: colorScheme.primary),
          title: const Text('Notificações Push'),
          subtitle: const Text('Receba alertas sobre pontos e recompensas'),
          trailing: Switch(
            value: notifications,
            onChanged: onNotifications,
          ),
        ),
        ListTile(
          leading: Icon(LucideIcons.volume2, color: colorScheme.primary),
          title: const Text('Sons do App'),
          subtitle: const Text('Efeitos sonoros e notificações'),
          trailing: Switch(
            value: soundEnabled,
            onChanged: onSoundEnabled,
          ),
        ),
        ListTile(
          leading: Icon(LucideIcons.mapPin, color: colorScheme.primary),
          title: const Text('Localização'),
          subtitle: const Text('Permitir acesso à localização'),
          trailing: Switch(
            value: locationEnabled,
            onChanged: onLocationEnabled,
          ),
        ),
        ListTile(
          leading: Icon(
            darkMode ? LucideIcons.moon : LucideIcons.sun,
            color: colorScheme.primary,
          ),
          title: const Text('Modo Escuro'),
          subtitle: const Text('Alternar tema claro/escuro'),
          trailing: Switch(
            value: darkMode,
            onChanged: onDarkMode,
          ),
        ),
        ListTile(
          leading: Icon(LucideIcons.globe, color: colorScheme.primary),
          title: const Text('Idioma'),
          subtitle: const Text('Português (Brasil)'),
        ),
        ListTile(
          leading: Icon(LucideIcons.helpCircle, color: colorScheme.primary),
          title: const Text('Central de Ajuda'),
          subtitle: const Text('FAQ e tutoriais'),
        ),
        ListTile(
          leading: Icon(LucideIcons.messageCircle, color: colorScheme.primary),
          title: const Text('Fale Conosco'),
          subtitle: const Text('Entre em contato com nossa equipe'),
        ),
        ListTile(
          leading: Icon(LucideIcons.fileText, color: colorScheme.primary),
          title: const Text('Termos de Uso'),
          subtitle: const Text('Políticas e termos do aplicativo'),
        ),
        ListTile(
          leading: Icon(LucideIcons.share2, color: colorScheme.primary),
          title: const Text('Compartilhar App'),
          subtitle: const Text('Convide amigos para o EcoPoints'),
        ),
        ListTile(
          leading: Icon(LucideIcons.download, color: colorScheme.primary),
          title: const Text('Exportar Dados'),
          subtitle: const Text('Baixe seus dados de reciclagem'),
        ),
        ListTile(
          leading: const Icon(LucideIcons.logOut, color: Colors.red),
          title: const Text(
            'Sair da Conta',
            style: TextStyle(color: Colors.red),
          ),
          subtitle: const Text('Fazer logout do aplicativo'),
        ),
      ],
    );
  }
}
