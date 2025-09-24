import 'package:get/get.dart';
import 'package:flutter/material.dart';

class JournalDetailController extends GetxController {
  final titleController = TextEditingController(text: "Title");
  final noteController = TextEditingController(text: "Note");

  RxBool isTitleEditing = false.obs;
  RxBool isNoteEditing = false.obs;

  void saveTitle() => isTitleEditing.value = false;
  void saveNote() => isNoteEditing.value = false;
}
