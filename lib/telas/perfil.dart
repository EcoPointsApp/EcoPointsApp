import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: colorScheme.primary,
                  child: Text('JD',
                      style: TextStyle(
                          color: colorScheme.onPrimary, fontSize: 28))),
              const SizedBox(height: 12),
              Text('Rafael Góes',
                  style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 4),
              Text('Reciclador desde março 2024',
                  style:
                      TextStyle(color: colorScheme.onSurface.withOpacity(0.6))),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
                child: Card(
                    child: ListTile(
                        title: const Text('127kg'),
                        subtitle: const Text('Total reciclado'),
                        leading: Icon(LucideIcons.recycle,
                            color: colorScheme.primary)))),
            const SizedBox(width: 8),
            Expanded(
                child: Card(
                    child: ListTile(
                        title: const Text('8'),
                        subtitle: const Text('Medalhas'),
                        leading: Icon(LucideIcons.award,
                            color: colorScheme.secondary)))),
            const SizedBox(width: 8),
            Expanded(
                child: Card(
                    child: ListTile(
                        title: const Text('15'),
                        subtitle: const Text('Recompensas'),
                        leading: Icon(LucideIcons.trendingUp,
                            color: Colors.amber)))),
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medalhas Conquistadas',
                    style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Icon(LucideIcons.star, color: Colors.yellow[700]),
                      const SizedBox(height: 4),
                      Text('Primeiro Passo', style: TextStyle(fontSize: 11))
                    ]),
                    Column(children: [
                      Icon(LucideIcons.leaf, color: Colors.green[700]),
                      const SizedBox(height: 4),
                      Text('Eco Guerreiro', style: TextStyle(fontSize: 11))
                    ]),
                    Column(children: [
                      Icon(LucideIcons.trophy, color: Colors.blue[700]),
                      const SizedBox(height: 4),
                      Text('Top 20', style: TextStyle(fontSize: 11))
                    ]),
                    Column(children: [
                      Icon(LucideIcons.award, color: Colors.grey[400]),
                      const SizedBox(height: 4),
                      Text('Mestre',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[400]))
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Seu Impacto Ambiental',
                    style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: colorScheme.primary)),
                const SizedBox(height: 12),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Água economizada'),
                      Text('2.540 litros',
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CO₂ evitado'),
                      Text('89 kg',
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Energia poupada'),
                      Text('156 kWh',
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
