import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 20),
                Text(
                  prefs.userName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  prefs.userBio,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInfoRow(
                      context,
                      prefs.soundEnabled ? Icons.volume_up : Icons.volume_mute,
                      'Sound',
                      prefs.soundEnabled ? 'Enabled' : 'Disabled',
                    ),
                    SizedBox(height: 5),
                    _buildInfoRow(
                      context,
                      prefs.vibrationEnabled
                          ? Icons.vibration
                          : Icons.smartphone,
                      'Vibration',
                      prefs.vibrationEnabled ? 'Enabled' : 'Disabled',
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.settings),
                  label: const Text('Edit Settings'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // AI suggest to create an reusable widget
  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
