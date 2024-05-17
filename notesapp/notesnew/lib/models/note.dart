class Note {
  String? id;
  final String title;
  final String description;
  // KARENA OPSIONAL BOLEH ADA BOLEH NGGAK
  String? imageUrl;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Note.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      imageUrl: data['image_url'],
      createdAt: data['created_at'] as Timestamp,
      updatedAt: data['updated_at'] as Timestamp,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class DocumentSnapshot {
  get id => null;
  
  data() {}
}

class Timestamp {
}
