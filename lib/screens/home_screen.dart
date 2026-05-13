import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/user_session.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserSession().getUser();

    return Scaffold(
      backgroundColor: const Color(0xFF1a0533),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2d1b69),
        elevation: 0,
        title: Text(
          'WBI Store Profile',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              UserSession().clearUser();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade300,
                    Colors.deepPurple.shade600,
                    Colors.purple.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.diamond_outlined,
                    color: Color(0xFF7c3aed),
                    size: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Selamat Datang,',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white54),
            ),
            Text(
              user?['firstName'] ?? '-',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoTile(
                    icon: Icons.tag,
                    label: 'ID',
                    value: user?['id']?.toString() ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.alternate_email,
                    label: 'USERNAME',
                    value: user?['username'] ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.email_outlined,
                    label: 'EMAIL',
                    value: user?['email'] ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.person_outline,
                    label: 'FIRST NAME',
                    value: user?['firstName'] ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.person_outline,
                    label: 'LAST NAME',
                    value: user?['lastName'] ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.wc_outlined,
                    label: 'GENDER',
                    value: user?['gender'] ?? '-',
                  ),
                  _buildInfoTile(
                    icon: Icons.security_outlined,
                    label: 'ACCESS TOKEN',
                    value: user?['accessToken'] != null
                        ? '${user!['accessToken'].toString().substring(0, 20)}...'
                        : '-',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF2d1b69),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.purple.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFc084fc), size: 20),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Colors.white38,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
