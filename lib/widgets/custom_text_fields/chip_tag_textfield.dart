import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';

class TagInputField extends StatefulWidget {
  const TagInputField({Key? key}) : super(key: key);

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final Set<String> chips = {};
  final TextEditingController controller = TextEditingController();
  late FocusNode inputFieldNode;

  @override
  void initState() {
    inputFieldNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    inputFieldNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void _addChip(String value) {
    setState(() {
      chips.add(value);
      controller.text = chips.join(', ');
    });
    FocusScope.of(context).requestFocus(inputFieldNode);
  }

  void _removeChip(String value) {
    setState(() {
      chips.remove(value);
      controller.text = chips.join(', ');
    });
  }

  Future<void> _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        // allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
      );

      if (result != null) {
        result.files.forEach((file) {
          _addChip(file.name);
        });
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (key) {
        if (controller.text.isEmpty &&
            key is RawKeyDownEvent &&
            key.data.logicalKey == LogicalKeyboardKey.backspace) {
          setState(() {
            chips.remove(chips.last);
          });
        }
      },
      child: Wrap(
        spacing: 5,
        runSpacing: -7,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ...chips.map(
                (value) => Chip(
              backgroundColor: AppColor.primaryColor,
              side: BorderSide.none,
              label: Text(
                value,
                style:  primaryTextStyle(fontSize: 10, color: Color(0xFF222222)),
                overflow: TextOverflow.ellipsis,
              ),
              onDeleted: () {
                _removeChip(value);
              },
              deleteIcon: const Icon(Icons.cancel),
            ),
          ),
          const SizedBox(width: 5),
          TextField(
            controller: controller,
            focusNode: inputFieldNode,
            readOnly: true,
            style: primaryTextStyle(fontSize: 11.0, color: AppColor.whiteColor),
            cursorColor: Colors.transparent,
            onTap: _pickFiles,
            decoration: InputDecoration(
              hintText: 'Tap to select certificates',
              hintStyle: primaryTextStyle(color: AppColor.blackColor, fontSize: 10.0),
              isDense: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 30.0,
                maxWidth: 30.0
              ),
              suffixIcon: const Icon(Icons.file_upload_outlined, color: AppColor.primaryColor, size: 30),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.blackColor, width: 1.0),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.blackColor, width: 1.0),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
