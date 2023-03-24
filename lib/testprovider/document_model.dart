import 'package:flutter/material.dart';

class Document {
  final int id;
  final String title;
  final String author;
  Color color;

  Document(
      {required this.id,
      required this.title,
      required this.author,
      required this.color});
}

class HistoryEntry {
  final DateTime date;
  final String description;

  HistoryEntry({required this.date, required this.description});
}

class DocumentModel extends ChangeNotifier {
  late int _selectedDocumentId;
  List<Document> _documents = [
    Document(id: 1, title: 'Document 1', color: Colors.blue, author: ''),
    Document(id: 2, title: 'Document 2', color: Colors.green, author: ''),
    Document(id: 3, title: 'Document 3', color: Colors.red, author: ''),
  ];

  int get selectedDocumentId => _selectedDocumentId;

  List<Document> get documents => _documents;

  void selectDocument(int id) {
    _selectedDocumentId = id;
    notifyListeners();
  }

  List<HistoryEntry> getDocumentHistory(int id) {
    // récupère les données historiques du document avec l'identifiant donné
    // retourne une liste d'objets HistoryEntry
    final document = _documents.firstWhere((doc) => doc.id == id);
    return [
      HistoryEntry(
          date: DateTime(2022, 2, 1), description: 'Création du document'),
      HistoryEntry(
          date: DateTime(2022, 2, 5),
          description: 'Ajout de la première section'),
      HistoryEntry(
          date: DateTime(2022, 2, 10),
          description: 'Modification de la section 1'),
      HistoryEntry(
          date: DateTime(2022, 2, 12), description: 'Ajout de la section 2'),
      HistoryEntry(
          date: DateTime(2022, 2, 15), description: 'Finalisation du document'),
    ];
  }

  void customizeDocumentColor(Color color) {
    // personnalise la couleur du document sélectionné avec la couleur donnée
    // met à jour l'objet Document correspondant dans la liste _documents
    // notifie les écouteurs que les données ont été mises à jour
  }
}
