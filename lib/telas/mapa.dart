import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaMapa extends StatelessWidget {
  const TelaMapa({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Text('Pontos de Coleta',
                  style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 8),
              Text('Encontre locais próximos para reciclar',
                  style:
                      TextStyle(color: colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Card(
          color: colorScheme.secondary.withOpacity(0.1),
          child: SizedBox(
            height: 180,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.mapPin,
                      color: colorScheme.primary, size: 48),
                  const SizedBox(height: 8),
                  Text('Mapa interativo em breve',
                      style: TextStyle(
                          color: colorScheme.onSurface.withOpacity(0.7))),
                  Text('Integração com Google Maps',
                      style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurface.withOpacity(0.5))),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Pontos Próximos',
            style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            title: const Text('UFPA - Campus Básico'),
            subtitle: const Text('Av. Augusto Corrêa, 01 - Guamá'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1.2 km', style: TextStyle(color: colorScheme.primary)),
                Text('Aberto',
                    style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurface.withOpacity(0.6))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            title: const Text('Mercado São Brás'),
            subtitle: const Text('Av. Generalíssimo Deodoro - São Brás'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2.1 km', style: TextStyle(color: colorScheme.primary)),
                Text('Aberto',
                    style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurface.withOpacity(0.6))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
