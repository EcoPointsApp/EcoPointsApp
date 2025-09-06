import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaHistorico extends StatelessWidget {
  const TelaHistorico({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Text('Histórico',
                  style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 8),
              Text('Suas atividades de reciclagem',
                  style:
                      TextStyle(color: colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Todos'))),
            const SizedBox(width: 8),
            Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Pontos'))),
            const SizedBox(width: 8),
            Expanded(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Recompensas'))),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: Icon(LucideIcons.recycle, color: Colors.green[700]),
            title: const Text('Reciclagem de Plástico'),
            subtitle: const Text('UFPA - Campus Básico\nHoje, 14:30'),
            trailing: Chip(
                label: const Text('+50 pts'),
                backgroundColor: Colors.green[100],
                labelStyle: const TextStyle(color: Colors.green)),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Icon(LucideIcons.gift, color: Colors.blue[700]),
            title: const Text('Resgate de Recompensa'),
            subtitle: const Text('Desconto Supermercado\nOntem, 16:45'),
            trailing: Chip(
                label: const Text('-500 pts'),
                backgroundColor: Colors.red[50],
                labelStyle: const TextStyle(color: Colors.red)),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Icon(LucideIcons.trophy, color: Colors.yellow[700]),
            title: const Text('Missão Completada'),
            subtitle: const Text('Recicle 5kg de papel\n2 dias atrás'),
            trailing: Chip(
                label: const Text('+200 pts'),
                backgroundColor: Colors.yellow[100],
                labelStyle: const TextStyle(color: Colors.orange)),
          ),
        ),
      ],
    );
  }
}
