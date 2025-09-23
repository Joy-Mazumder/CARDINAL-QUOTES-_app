
  import 'package:cardinal_app/utils/constants/image_strings.dart';

class ItemModel{
    final String title;
    final String imageUrl;

    ItemModel({required this.title, required this.imageUrl});
  }

  final List<ItemModel> homeTopList = [
    ItemModel(title: "Popular", imageUrl: AllImages.ht1),
    ItemModel(title: "Latest", imageUrl: AllImages.ht2),
    ItemModel(title: "Grief & Loss", imageUrl: AllImages.ht3),
    ItemModel(title: "Poems & Poetry", imageUrl: AllImages.ht4),
    ItemModel(title: "Remembering", imageUrl: AllImages.ht5),
    ItemModel(title: "Heavenly", imageUrl: AllImages.ht7),
    ItemModel(title: "Memories", imageUrl: AllImages.ht8),
    
  ];

