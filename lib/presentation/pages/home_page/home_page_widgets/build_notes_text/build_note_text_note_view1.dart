import 'package:flutter/material.dart';

import '../../../../../data/models/Note/note_text_model.dart';
import '../../../../../utils/formatters/date_formatter.dart';
import '../../../../../utils/note_color/note_color.dart';

class NoteTextView1Small extends StatelessWidget {
  final NoteText note;
  const NoteTextView1Small({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      shape: const BeveledRectangleBorder(),
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 18, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text title
                  Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text body
                  Text(
                    note.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      note.isFavorite
                          ? Stack(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: NoteColorOperations.getColorFromNumber(
                                      colorNumber: note.color),
                                  size: 28,
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amberAccent.shade100,
                                  size: 28,
                                ),
                              ],
                            )
                          : const Opacity(
                              opacity: 0,
                              child: Icon(
                                Icons.circle,
                                size: 28,
                              ),
                            ),
                      Text(
                        // Date of last modification
                        DateFormatter.showDateFormatted(
                            note.lastModificationDate),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: NoteColorOperations.getColorFromNumber(
                              colorNumber: note.color),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Top of the note card
// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     // Expanded(
//     //   child: Align(
//     //     alignment: Alignment.topLeft,
//     //     child: Text(
//     //       // Date of last modification
//     //       DateFormatter.showDateFormatted(
//     //           note.lastModificationDate),
//     //       style: TextStyle(
//     //           fontSize: 22,
//     //           color: Colors.grey[700],
//     //           fontWeight: FontWeight.w600),
//     //     ),
//     //   ),
//     // ),
//     // Expanded(
//     //   child: Align(
//     //     alignment: Alignment.topRight,
//     //     child: note.isFavorite
//     //         ? Stack(
//     //             children: const [
//     //               Icon(
//     //                 Icons.star,
//     //                 color: Color.fromARGB(255, 255, 255, 0),
//     //                 size: 26,
//     //               ),
//     //               Icon(
//     //                 Icons.star_border,
//     //                 color: Colors.black,
//     //                 size: 26,
//     //               ),
//     //             ],
//     //           )
//     //         : const Opacity(
//     //             opacity: 0,
//     //             child: Icon(
//     //               Icons.star,
//     //               size: 26,
//     //             ),
//     //           ),
//     //   ),
//     // ),
//   ],
// ),
// const SizedBox(height: 8),
