import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:mycustomnotes/data/models/User/user_configuration.dart';
import 'package:mycustomnotes/domain/services/user_configuration_service.dart';
import 'package:mycustomnotes/utils/dialogs/user_configuration_notes_view.dart';
import '../../../../utils/dialogs/confirmation_dialog.dart';

class NavigationDrawerHomePage extends StatelessWidget {
  final User currentUser;
  final UserConfiguration userConfiguration;
  final Function updateUserConfiguration;

  const NavigationDrawerHomePage({
    super.key,
    required this.currentUser,
    required this.userConfiguration,
    required this.updateUserConfiguration,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      width: 250,
      child: Column(
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        runSpacing: 20,
        children: [
          // Title
          const ListTile(
            title: Text(
              'Settings menu',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ), // Change language
          const Divider(thickness: 1),
          changeLanguage(context: context),
          const Divider(thickness: 1),
          dateAndHourStyle(context: context),
          const Divider(thickness: 1),
          notesStyleVisualization(context: context),
          const Divider(thickness: 1),
          logout(context: context),
          const Divider(thickness: 1),
        ],
      ),
    );
  }

  Widget changeLanguage({
    required BuildContext context,
  }) {
    return ListTile(
      leading: const Icon(Icons.language, size: 28),
      onTap: () {},
      title: const Text(
        'Language',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget dateAndHourStyle({
    required BuildContext context,
  }) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.date_range, size: 28),
      title: const Text(
        'Date and time format',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget notesStyleVisualization({
    required BuildContext context,
  }) {
    return ListTile(
      onTap: () async {
        int? userNoteView = await UserConfigurationNotesView.changeNotesView(
            context: context, userConfiguration: userConfiguration);
        if (userNoteView != null) {
          UserConfigurationService.editUserConfigurations(
                  userId: currentUser.uid, notesView: userNoteView)
              .then((_) async {
            updateUserConfiguration();
            Navigator.maybePop(context);
          });
        }
      },
      leading: const Icon(Icons.grid_view, size: 28),
      title: const Text(
        'Notes view',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget logout({
    required BuildContext context,
  }) {
    return ListTile(
      onTap: () {
        ConfirmationDialog.logOutDialog(context);
      },
      leading: Transform.scale(
        scaleX: -1,
        child: const Icon(
          Icons.logout,
          size: 28,
        ),
      ),
      title: const Text(
        'Log out',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
