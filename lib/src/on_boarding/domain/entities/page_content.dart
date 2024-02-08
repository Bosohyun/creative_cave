import 'package:creative_cave/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  const PageContent.first()
      : this(
            title: 'Welcome to Creative Cave',
            image: MediaRes.onBoardingImage2,
            description:
                "Join Creative Cave : where passion meets progression, one note at a time.");

  @override
  List<Object?> get props => [image, title, description];
}
