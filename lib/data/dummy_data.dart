import 'models/post_content.dart';

/// Hardcoded content — the brief explicitly asks to avoid backend/API work
/// and demo the UI with static values.
class DummyData {
  DummyData._();

  static final List<PostContent> posts = [
    PostContent(
      id: 'content_10',
      imageUrl:
          'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=800&q=80',
      authorName: 'Ready to share',
      authorSubtitle: 'High converting in Oriflame Community',
      badgeLabel: 'Ready to share',
      caption:
          '💋 Keep your lips soft, plump, and perfectly hydrated all day! '
          'Our Hyaluronic Lip Balm is infused with natural moisture-locking '
          'ingredients that smooth, protect, and give you that irresistible '
          'shine. ✨🔥 #HydratedLips #OriflameGlow #ShopNow\n\n'
          'Buy my referral link: https://oriflame.com/lipbalm/ABCDE123\n'
          'Use my referral code: ABCDE123',
    ),
    PostContent(
      id: 'content_11',
      imageUrl:
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=800&q=80',
      authorName: 'Ready to share',
      authorSubtitle: 'High converting in Oriflame Community',
      badgeLabel: 'Recommended',
      caption:
          '🎁 Gifting made effortless. Our limited-edition wrap turns any '
          'Oriflame favorite into a moment worth remembering. Perfect for '
          'birthdays, anniversaries, or just because. 🎀 #GiftedByOriflame '
          '#SelfCareSunday\n\n'
          'Buy my referral link: https://oriflame.com/giftset/FGHIJ456\n'
          'Use my referral code: FGHIJ456',
    ),
    PostContent(
      id: 'content_21',
      imageUrl:
          'https://images.unsplash.com/photo-1612817159949-195b6eb9e31a?w=800&q=80',
      authorName: 'Ready to share',
      authorSubtitle: 'High converting in Oriflame Community',
      badgeLabel: 'Trending',
      caption:
          '🕯️ Slow down, light up, and treat yourself to a little luxury. '
          'This fragrance layers warm vanilla with soft florals for a scent '
          'that lingers beautifully. 🌸 #OriflameMoments #SelfLove\n\n'
          'Buy my referral link: https://oriflame.com/fragrance/KLMNO789\n'
          'Use my referral code: KLMNO789',
    ),
  ];
}
