import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaEstatisticas extends StatelessWidget {
  const TelaEstatisticas({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Text('Estatísticas',
                  style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 8),
              Text('Acompanhe seu progresso',
                  style:
                      TextStyle(color: colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Resumo de Janeiro',
                    style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: Column(children: [
                      Text('45kg',
                          style: TextStyle(
                              fontSize: 22,
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold)),
                      Text('Material reciclado',
                          style: TextStyle(
                              color: colorScheme.onSurface.withOpacity(0.6)))
                    ])),
                    Expanded(
                        child: Column(children: [
                      Text('850',
                          style: TextStyle(
                              fontSize: 22,
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.bold)),
                      Text('Pontos ganhos',
                          style: TextStyle(
                              color: colorScheme.onSurface.withOpacity(0.6)))
                    ])),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                    value: 0.75,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8)),
                const SizedBox(height: 8),
                Text('75% da meta mensal',
                    style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurface.withOpacity(0.6))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Por Tipo de Material',
                    style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                _buildMaterialStat('Plástico', '18kg (40%)', Colors.blue),
                _buildMaterialStat('Papel', '15kg (33%)', Colors.green),
                _buildMaterialStat('Metal', '8kg (18%)', Colors.yellow[700]!),
                _buildMaterialStat('Vidro', '4kg (9%)', Colors.purple),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Impacto Ambiental Total',
                    style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: colorScheme.primary)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: Column(children: [
                      Text('89kg',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green)),
                      Text('CO₂ evitado',
                          style: TextStyle(fontSize: 12, color: Colors.green))
                    ])),
                  ],
                ),
                const SizedBox(height: 8),
                Row(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialStat(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(6))),
              const SizedBox(width: 8),
              Text(label),
            ],
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
