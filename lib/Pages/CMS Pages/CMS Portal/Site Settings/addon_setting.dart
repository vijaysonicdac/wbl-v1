import 'package:flutter/material.dart';

class AddonSetting extends StatefulWidget {
  const AddonSetting({super.key});

  @override
  State<AddonSetting> createState() => _AddonSettingState();
}

class _AddonSettingState extends State<AddonSetting> {
  final titleController = TextEditingController();
  final keywordsControllws = TextEditingController();
  String? validateData(String? value) {
    if (value == null || value.isEmpty) {
      return 'This fields is required';
    }
    return null;
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final String metaDescription = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('Website Meta Title'),
                          SizedBox(
                            height: 5,
                          ),
                          mytextfield(validateData, titleController),
                          SizedBox(
                            height: 16,
                          ),
                          myText('Website Meta Keywords'),
                          mytextfield(validateData, keywordsControllws),
                          SizedBox(
                            height: 16,
                          ),
                          myText('Meta Description'),
                          SizedBox(
                            height: 5,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 800),
                            child: Scrollbar(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                controller: TextEditingController(
                                    text: metaDescription),
                                maxLines: null,
                                validator: validateData,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                formkey.currentState!.validate();
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              child: Text("Update")),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget mytextfield(
      String? Function(String?) validator, TextEditingController? controller) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
        ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
