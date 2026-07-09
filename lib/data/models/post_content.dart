/// Represents a single "smart post" card the user can browse and share.
/// Mirrors the repeating "Content 10 / 11 / 21..." frames in the Figma file.
class PostContent {
  final String id;
  final String imageUrl;
  final String authorName;
  final String authorSubtitle;
  final String badgeLabel;
  final String caption;

  const PostContent({
    required this.id,
    required this.imageUrl,
    required this.authorName,
    required this.authorSubtitle,
    required this.badgeLabel,
    required this.caption,
  });

  PostContent copyWith({String? caption}) {
    return PostContent(
      id: id,
      imageUrl: imageUrl,
      authorName: authorName,
      authorSubtitle: authorSubtitle,
      badgeLabel: badgeLabel,
      caption: caption ?? this.caption,
    );
  }
}
