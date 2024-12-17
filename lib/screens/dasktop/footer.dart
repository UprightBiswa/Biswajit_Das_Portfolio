import 'package:flutter/material.dart';

import '../../utils/responseve_layout.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: ResponsiveLayout(
        mobile: _buildMobileFooter(),
        tablet: _buildTabletFooter(),
        desktop: _buildDesktopFooter(),
      ),
    );
  }

  // Widget for Mobile Footer
  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogoSection(),
        const SizedBox(height: 20),
        _buildSocialIcons(),
        const SizedBox(height: 20),
        _buildLinksSection(),
        const Divider(color: Colors.grey, height: 30),
        const Text(
          '© 2024 Biswajit Das. All Rights Reserved.',
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Widget for Tablet Footer
  Widget _buildTabletFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogoSection(),
            _buildSocialIcons(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLinksSection(),
            const SizedBox(width: 20),
            _buildContactInfoSection(),
          ],
        ),
        const Divider(color: Colors.grey, height: 30),
        const Text(
          '© 2024 Biswajit Das. All Rights Reserved.',
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Widget for Desktop Footer
  Widget _buildDesktopFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogoSection(),
            _buildSocialIcons(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLinksSection(),
            const SizedBox(width: 40),
            _buildContactInfoSection(),
          ],
        ),
        const Divider(color: Colors.grey, height: 30),
        const Text(
          '© 2024 Biswajit Das. All Rights Reserved.',
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Logo Section
  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Biswajit Das',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Building modern, responsive, and user-centric solutions.',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
      ],
    );
  }

  // Social Icons Section
  Widget _buildSocialIcons() {
    return Row(
      children: [
        _socialIcon(icon: Icons.facebook, onTap: () {}),
        _socialIcon(icon: Icons.link, onTap: () {}),
        _socialIcon(icon: Icons.facebook, onTap: () {}),
        _socialIcon(icon: Icons.email, onTap: () {}),
      ],
    );
  }

  Widget _socialIcon({required IconData icon, required Function() onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  // Links Section
  Widget _buildLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        _linkText('Privacy Policy', () {}),
        _linkText('Terms of Service', () {}),
        _linkText('About Us', () {}),
        _linkText('Contact Support', () {}),
      ],
    );
  }

  Widget _linkText(String text, Function() onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  // Contact Info Section
  Widget _buildContactInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Email: contact@biswajitdas.com',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          'Phone: +91-123-456-7890',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
        const SizedBox(height: 10),
        Text(
          'Address:',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
        Text(
          '123 Digital Lane,\nInnovation City, IN - 560001',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
      ],
    );
  }
}
