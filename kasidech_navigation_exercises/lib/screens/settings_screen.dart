import 'package:flutter/material.dart';
import 'package:kasidech_navigation_exercises/states/quiz_preferences_state.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showNameDialog(BuildContext context, String field, String current) {
    final controller = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit $field'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (field == 'Name') {
                context.read<QuizPreferencesState>().setUserName(
                  controller.text.trim(),
                );
              } else {
                context.read<QuizPreferencesState>().setUserBio(
                  controller.text.trim(),
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          Text(
            'Profile',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            title: const Text('User Name'),
            subtitle: Text(prefs.userName),
            leading: const Icon(Icons.person),
            onTap: () => _showNameDialog(context, 'Name', prefs.userName),
          ),
          ListTile(
            title: const Text('Bio'),
            subtitle: Text(prefs.userBio),
            leading: const Icon(Icons.info_outline),
            onTap: () => _showNameDialog(context, 'Bio', prefs.userBio),
          ),

          const Divider(),
          Text(
            'Sound & Feedback',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          SwitchListTile(
            title: const Text('Sound Enabled'),
            value: prefs.soundEnabled,
            onChanged: (val) =>
                context.read<QuizPreferencesState>().setSoundEnabled(val),
            secondary: const Icon(Icons.volume_up),
          ),
          SwitchListTile(
            title: const Text('Vibration Enabled'),
            value: prefs.vibrationEnabled,
            onChanged: (val) =>
                context.read<QuizPreferencesState>().setVibrationEnabled(val),
            secondary: const Icon(Icons.vibration),
          ),

          const Divider(),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: prefs.themeMode,
            onChanged: (val) =>
                context.read<QuizPreferencesState>().setThemeMode(val!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: prefs.themeMode,
            onChanged: (val) =>
                context.read<QuizPreferencesState>().setThemeMode(val!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: prefs.themeMode,
            onChanged: (val) =>
                context.read<QuizPreferencesState>().setThemeMode(val!),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        label: const Text('View Profile'),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

}
