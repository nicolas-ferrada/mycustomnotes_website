import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/Note/note_notifier.dart';
import '../../../../domain/services/auth_user_service.dart';
import '../../../../domain/services/note_tasks_service.dart';
import '../../../../utils/exceptions/exceptions_alert_dialog.dart';
import '../../../../utils/internet/check_internet_connection.dart';
import '../../../../utils/note_color/note_color.dart';
import '../../../../utils/snackbars/snackbar_message.dart';

class Tasks {
  bool isTaskCompleted;
  String taskName;

  Tasks({
    required this.isTaskCompleted,
    required this.taskName,
  });
}

class NoteTasksCreatePage extends StatefulWidget {
  const NoteTasksCreatePage({super.key});

  @override
  State<NoteTasksCreatePage> createState() => _NoteTasksCreatePageState();
}

class _NoteTasksCreatePageState extends State<NoteTasksCreatePage> {
  final currentUser = AuthUserService.getCurrentUserFirebase();

  final _noteTitleController = TextEditingController();

  final List<Tasks> _textFormFieldValues = [];

  bool isNoteFavorite = false;

  bool _isCreateButtonVisible = false;

  int intNoteColor = 0;

  Color noteColorPaletteIcon = Colors.grey;
  Color noteColorFavoriteIcon = Colors.grey;

  @override
  void dispose() {
    _noteTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Note's title, favorite and pick color icons
      appBar: AppBar(
        title: TextFormField(
          controller: _noteTitleController,
          onChanged: (value) {
            setState(() {
              _isCreateButtonVisible = true;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Tasks title",
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 2),
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    late Color newColor;
                    Color? getColorFromDialog =
                        await NoteColorOperations.pickNoteColorDialog(
                            context: context);
                    if (getColorFromDialog != null) {
                      newColor = getColorFromDialog;
                    } else {
                      newColor = NoteColorOperations.getColorFromNumber(
                          colorNumber: intNoteColor);
                    }
                    // Difine the note color
                    intNoteColor =
                        NoteColorOperations.getNumberFromColor(color: newColor);
                    setState(() {
                      noteColorPaletteIcon = newColor;
                    });
                  },
                  icon: Icon(
                    Icons.palette,
                    color: noteColorPaletteIcon,
                    size: 28,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: noteColorFavoriteIcon,
                    size: 28,
                  ),
                  onPressed: () {
                    if (!isNoteFavorite) {
                      // It was not favorite, now it is
                      setState(() {
                        noteColorFavoriteIcon = Colors.amberAccent;
                      });
                      isNoteFavorite = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarMessage.snackBarMessage(
                              message: 'Note marked as favorite',
                              backgroundColor: Colors.amberAccent));
                    } else {
                      // It was favorite, now it is not
                      setState(() {
                        noteColorFavoriteIcon = Colors.grey;
                      });
                      isNoteFavorite = false;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // Note's body
      body: noteCreatePageBody(),
      // Save button, only visible if user changes the note
      floatingActionButton: noteCreatePageFloatingActionButton(context),
    );
  }

  Padding noteCreatePageBody() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: _textFormFieldValues.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                trailing: Checkbox(
                  value: _textFormFieldValues[index].isTaskCompleted,
                  onChanged: (value) => setState(() {
                    _textFormFieldValues[index].isTaskCompleted = value!;
                  }),
                ),
                title: TextFormField(
                  initialValue: _textFormFieldValues[index].taskName,
                  onChanged: (value) =>
                      _textFormFieldValues[index].taskName = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task',
                  ),
                ),
              ),
            );
          }),
    );
  }

  Row noteCreatePageFloatingActionButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              heroTag: null,
              tooltip: 'Add a new task',
              onPressed: () async {
                setState(() {
                  _textFormFieldValues
                      .add(Tasks(isTaskCompleted: false, taskName: ''));
                });
              },
              backgroundColor: const Color.fromRGBO(250, 216, 90, 0.9),
              label: const Text(
                'New task',
              ),
              icon: const Icon(Icons.add),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              heroTag: null,
              tooltip: 'Create the note',
              onPressed: () async {
                // Create note button
                try {
                  // Check if device it's connected to any network
                  bool isDeviceConnected =
                      await CheckInternetConnection.checkInternetConnection();
                  int waitingConnection = 5;

                  // If device is connected, wait 5 seconds, if is not connected, dont wait.
                  if (isDeviceConnected) {
                    waitingConnection = 5;
                  } else {
                    waitingConnection = 0;
                  }

                  // Create note on firebase, it will wait depending if the device it's connected to a network
                  await NoteTasksService.createNoteTasks(
                    title: _noteTitleController.text,
                    tasks: getTextFormFieldValues(),
                    userId: currentUser.uid,
                    isFavorite: isNoteFavorite,
                    color: intNoteColor,
                  ).timeout(
                    Duration(seconds: waitingConnection),
                    onTimeout: () {
                      Provider.of<NoteNotifier>(context, listen: false)
                          .refreshNotes();

                      Navigator.of(context).maybePop();
                    },
                  );
                  if (context.mounted) {
                    Provider.of<NoteNotifier>(context, listen: false)
                        .refreshNotes();

                    Navigator.of(context).maybePop();
                  }
                } catch (errorMessage) {
                  ExceptionsAlertDialog.showErrorDialog(
                      context, errorMessage.toString());
                }
              },
              backgroundColor: const Color.fromRGBO(250, 216, 90, 0.9),
              label: const Text(
                'Create note',
              ),
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> getTextFormFieldValues() {
    return _textFormFieldValues
        .map((task) => {
              'isTaskCompleted': task.isTaskCompleted,
              'taskName': task.taskName
            })
        .toList();
  }
}
