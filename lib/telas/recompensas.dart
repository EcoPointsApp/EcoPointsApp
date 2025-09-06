import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaRecompensas extends StatelessWidget {
  const TelaRecompensas({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Text('Suas Recompensas', style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 8),
              Text('Troque seus pontos por benefícios incríveis', style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Card(
          child: ListTile(
            leading: Container(width: 56, height: 56, color: Colors.grey[200]),
            title: const Text('10% de desconto'),
            subtitle: const Text('Supermercado Líder'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: const Text('500 pontos')),
                const SizedBox(height: 4),
                ElevatedButton(onPressed: () {}, child: const Text('Resgatar'), style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: Container(width: 56, height: 56, color: Colors.grey[200]),
            title: const Text('Ingresso de Cinema'),
            subtitle: const Text('Shopping Pátio Belém'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: const Text('800 pontos')),
                const SizedBox(height: 4),
                ElevatedButton(onPressed: () {}, child: const Text('Resgatar'), style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: Container(width: 56, height: 56, color: Colors.grey[200]),
            title: Text('R\$ 20 em comida'),
            subtitle: const Text('Restaurante Açaí do Pará'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: const Text('600 pontos')),
                const SizedBox(height: 4),
                ElevatedButton(onPressed: () {}, child: const Text('Resgatar'), style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
