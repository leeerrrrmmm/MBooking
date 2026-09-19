import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.biometricsEnabled,
    required this.onMyTicket,
    required this.onPaymentHistory,
    required this.onChangeLanguage,
    required this.onChangePassword,
    required this.onBiometricsChanged,
  });

  final bool biometricsEnabled;
  final VoidCallback onMyTicket;
  final VoidCallback onPaymentHistory;
  final VoidCallback onChangeLanguage;
  final VoidCallback onChangePassword;
  final ValueChanged<bool> onBiometricsChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _MenuTile(
            icon: Icons.confirmation_num_outlined,
            label: 'My ticket',
            onTap: onMyTicket,
          ),
          const _MenuDivider(),
          _MenuTile(
            icon: Icons.shopping_cart_outlined,
            label: 'Payment history',
            onTap: onPaymentHistory,
          ),
          const _MenuDivider(),
          _MenuTile(
            icon: Icons.translate_outlined,
            label: 'Change language',
            onTap: onChangeLanguage,
          ),
          const _MenuDivider(),
          _MenuTile(
            icon: Icons.lock_outline,
            label: 'Change password',
            onTap: onChangePassword,
          ),
          const _MenuDivider(),
          _MenuSwitchTile(
            icon: Icons.face_retouching_natural_outlined,
            label: 'Face ID / Touch ID',
            value: biometricsEnabled,
            onChanged: onBiometricsChanged,
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.white.withValues(alpha: 0.08),
        highlightColor: Colors.white.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white70, size: 22),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white38, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuSwitchTile extends StatelessWidget {
  const _MenuSwitchTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.amber,
            inactiveThumbColor: Colors.white70,
            inactiveTrackColor: Colors.white24,
          ),
        ],
      ),
    );
  }
}

class _MenuDivider extends StatelessWidget {
  const _MenuDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.white12,
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
