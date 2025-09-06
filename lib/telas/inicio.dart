import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TelaInicio extends StatelessWidget {
  final int userPoints;
  final VoidCallback onMenu;
  final VoidCallback onNotificacoes;
  final VoidCallback onPontosProximos;
  const TelaInicio({
    super.key,
    required this.userPoints,
    required this.onMenu,
    required this.onNotificacoes,
    required this.onPontosProximos,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header do usuário
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: colorScheme.primary,
                  child: Text('JD',
                      style: GoogleFonts.spaceGrotesk(
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
                    Row(
                      children: [
                        Icon(LucideIcons.mapPin,
                            size: 16, color: colorScheme.secondary),
                        const SizedBox(width: 4),
                        Text('Belém, Pará',
                            style: TextStyle(
                                fontSize: 13,
                                color: colorScheme.onSurface.withOpacity(0.6))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon:
                  Icon(LucideIcons.bell, color: colorScheme.primary, size: 28),
              onPressed: () {
                // Chama o callback passado pelo pai
                onNotificacoes();
              },
              tooltip: 'Notificações',
            ),
          ],
        ),
        const SizedBox(height: 22),
        // Card de pontos com gradiente
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.primary, colorScheme.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.18),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Seus EcoPoints',
                        style: TextStyle(
                            color: colorScheme.onPrimary.withOpacity(0.9),
                            fontSize: 15)),
                    Row(
                      children: [
                        Icon(LucideIcons.leaf, color: Colors.white, size: 30),
                        const SizedBox(width: 8),
                        Text(userPoints.toString(),
                            style: GoogleFonts.spaceGrotesk(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Icon(LucideIcons.trendingUp,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(height: 8),
                    Text('Próx. nível',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12)),
                    Text('Reciclador Ouro',
                        style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        // Cards semana/ranking com gradiente e ícones
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green[100]!, Colors.green[50]!]),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(LucideIcons.treePine,
                              color: Colors.green[700], size: 18),
                          const SizedBox(width: 4),
                          Text('Esta Semana',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('12kg',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800])),
                      Text('+3kg vs semana passada',
                          style: TextStyle(
                              fontSize: 12, color: Colors.green[600])),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[100]!, Colors.blue[50]!]),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(LucideIcons.trophy,
                              color: Colors.blue[700], size: 18),
                          const SizedBox(width: 4),
                          Text('Ranking',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('#12',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800])),
                      Row(
                        children: [
                          Icon(LucideIcons.arrowUp,
                              color: Colors.blue[600], size: 14),
                          const SizedBox(width: 2),
                          Text('Subiu 3 posições',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue[600])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        // Banner rotativo de imagens
        SizedBox(
          height: 120,
          child: _BannerCarousel(),
        ),
        const SizedBox(height: 22),
        // Missões da Semana com cards coloridos
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 2,
          shadowColor: colorScheme.primary.withOpacity(0.08),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(LucideIcons.target,
                        color: colorScheme.primary, size: 22),
                    const SizedBox(width: 8),
                    Text('Missões da Semana',
                        style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const Spacer(),
                    Chip(
                        label: Text('2/4'),
                        backgroundColor:
                            colorScheme.secondary.withOpacity(0.2)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildMissionCard(
                    'Recicle 10kg de plástico',
                    '7kg / 10kg completados',
                    70,
                    '+200 pts',
                    Colors.green[50]!,
                    Colors.green[200]!,
                    colorScheme.primary,
                    LucideIcons.recycle),
                const SizedBox(height: 10),
                _buildMissionCard(
                    'Visite 3 pontos diferentes',
                    '1 / 3 pontos visitados',
                    33,
                    '+150 pts',
                    Colors.blue[50]!,
                    Colors.blue[200]!,
                    colorScheme.secondary,
                    LucideIcons.mapPin),
                const SizedBox(height: 10),
                _buildMissionCard(
                    'Convide 2 amigos',
                    '0 / 2 convites enviados',
                    0,
                    '+300 pts',
                    Colors.yellow[50]!,
                    Colors.yellow[200]!,
                    Colors.yellow[700]!,
                    LucideIcons.users),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        // Impacto Hoje com gradiente
        Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.teal[400]!, Colors.teal[700]!]),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  color: Colors.teal[700]!.withOpacity(0.10),
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(LucideIcons.sparkles, color: Colors.white, size: 22),
                    const SizedBox(width: 8),
                    Text('Seu Impacto Hoje',
                        style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildImpactStat(LucideIcons.droplets, '127L',
                        'Água poupada', Colors.cyan[100]!),
                    _buildImpactStat(LucideIcons.wind, '3.2kg', 'CO₂ evitado',
                        Colors.cyan[100]!),
                    _buildImpactStat(LucideIcons.zap, '5.8kWh', 'Energia salva',
                        Colors.cyan[100]!),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        // Top Recicladores
        Card(
          elevation: 2,
          shadowColor: colorScheme.primary.withOpacity(0.08),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(LucideIcons.users,
                        color: colorScheme.primary, size: 20),
                    const SizedBox(width: 8),
                    Text('Top Recicladores - Belém',
                        style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 14),
                _buildTopRecycler(
                    1,
                    'Maria Ribeiro',
                    '2.847 pontos',
                    Colors.yellow[700]!,
                    Colors.yellow[50]!,
                    true,
                    LucideIcons.award),
                const SizedBox(height: 10),
                _buildTopRecycler(
                    2,
                    'Pedro Santos',
                    '2.156 pontos',
                    Colors.grey[400]!,
                    Colors.grey[100]!,
                    false,
                    LucideIcons.award),
                const SizedBox(height: 10),
                _buildTopRecycler(
                    12,
                    'Rafael Góes (Você)',
                    '1.250 pontos',
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.08),
                    true,
                    LucideIcons.user,
                    isYou: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMissionCard(
      String title,
      String subtitle,
      int progress,
      String badge,
      Color bg,
      Color progressColor,
      Color badgeColor,
      IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: progressColor.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
              color: progressColor.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2))
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: badgeColor, size: 20),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: badgeColor)),
                      Text(subtitle,
                          style: TextStyle(
                              fontSize: 12,
                              color: badgeColor.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
              Chip(
                  label: Text(badge),
                  backgroundColor: badgeColor,
                  labelStyle: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: progressColor.withOpacity(0.3),
            color: progressColor,
            minHeight: 7,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactStat(
      IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: Colors.teal[700], size: 22),
        ),
        const SizedBox(height: 4),
        Text(value,
            style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white)),
        Text(label,
            style:
                TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.9))),
      ],
    );
  }

  Widget _buildTopRecycler(int pos, String name, String points, Color color,
      Color bg, bool showIcon, IconData icon,
      {bool isYou = false}) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border:
            isYou ? Border.all(color: color.withOpacity(0.3), width: 2) : null,
        boxShadow: [
          if (isYou)
            BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2))
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text('$pos',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 18,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                Text(points,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          if (showIcon) Icon(LucideIcons.trophy, color: color, size: 18),
          if (isYou)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Chip(
                  label: const Text('Você'),
                  backgroundColor: color,
                  labelStyle:
                      const TextStyle(color: Colors.white, fontSize: 11)),
            ),
        ],
      ),
    );
  }
}

// Widget do carrossel automático
class _BannerCarousel extends StatefulWidget {
  @override
  State<_BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<_BannerCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _autoScroll);
  }

  void _autoScroll() {
    if (!mounted) return;
    int nextPage = (_currentPage + 1) % _images.length;
    _controller.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = nextPage);
    Future.delayed(const Duration(seconds: 3), _autoScroll);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: _images.length,
      onPageChanged: (i) => setState(() => _currentPage = i),
      itemBuilder: (context, i) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(_images[i]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
