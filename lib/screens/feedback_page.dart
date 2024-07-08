import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      String message;

      try {
        final collection = FirebaseFirestore.instance.collection('feedback');

        await collection.add({
          'timestamp': FieldValue.serverTimestamp(),
          'feedback': _controller.text,
        });

        message = 'Kritik dan Saran berhasil dikirim';
      } catch (e) {
        message = 'Terjadi kesalahan saat mengirim Kritik dan Saran';
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kritik dan Saran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Bagikan kritik atau saran Anda',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Ketik kritik atau saran Anda di sini...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                ),
                maxLines: 5,
                maxLength: 4096,
                textInputAction: TextInputAction.done,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'Silakan masukkan kritik atau saran Anda';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: const Text('Kirim'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
