import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'document_model.dart';

class DocumentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des documents'),
      ),
      // body: Consumer<DocumentModel>(
      //   builder: (context, documentModel, child) {
      //     return ListView.builder(
      //       itemCount: documentModel.documents.length,
      //       itemBuilder: (context, index) {
      //         final document = documentModel.documents[index];
      //         return ListTile(
      //           title: Text(document.title),
      //           onTap: () {
      //             documentModel.selectDocument(document.id);
      //             // Navigator.pushNamed(context, '/documentHistory');
      //           },
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
