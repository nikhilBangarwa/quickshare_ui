import 'dart:async';
import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../data/dummy_data.dart';
import '../data/models/post_content.dart';
import '../widgets/quick_share_top_bar.dart';
import '../widgets/quick_share_tabs.dart';
import '../widgets/post_card.dart';
import '../widgets/caption_section.dart';
import '../widgets/social_share_row.dart';
import '../widgets/quick_share_bottom_nav.dart';
import '../widgets/smart_post_loading_view.dart';

class QuickShareScreen extends StatefulWidget {
  const QuickShareScreen({super.key});

  @override
  State<QuickShareScreen> createState() => _QuickShareScreenState();
}

class _QuickShareScreenState extends State<QuickShareScreen> {
  late List<PostContent> _posts;
  int _activePage = 0;
  int _activeTab = 0;

  // Loading state (Content 18-20 / 22-24): a checklist that fills in before
  // the actual Smart Post feed is revealed. Kept on the same screen/route so
  // this stays a genuine single-page UI rather than a separate loading route.
  final List<bool> _completedSteps =
      List.filled(SmartPostLoadingView.stepLabels.length, false);
  bool _isLoadingContent = true;
  bool _loadingAllDone = false;
  Timer? _loadingTimer;

  @override
  void initState() {
    super.initState();
    _posts = List.of(DummyData.posts);
    _runLoadingSequence();
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  void _runLoadingSequence() {
    const stepDelay = Duration(milliseconds: 550);
    int step = 0;
    _loadingTimer = Timer.periodic(stepDelay, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (step < _completedSteps.length) {
        setState(() => _completedSteps[step] = true);
        step++;
      } else {
        timer.cancel();
        setState(() => _loadingAllDone = true);
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) setState(() => _isLoadingContent = false);
        });
      }
    });
  }

  void _onCaptionSaved(String newCaption) {
    setState(() {
      _posts[_activePage] = _posts[_activePage].copyWith(caption: newCaption);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Simple responsive clamp: the design is mobile-first (375 reference
    // width); on wider screens (tablet/web/desktop) we center the content
    // in a fixed-width column instead of letting it stretch edge to edge.
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > AppBreakpoints.tablet
        ? AppBreakpoints.mobileReference + 60
        : screenWidth;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const QuickShareTopBar(),
      body: Center(
        child: SizedBox(
          width: contentWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QuickShareTabs(
                  activeIndex: _activeTab,
                  onChanged: (i) => setState(() => _activeTab = i),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isLoadingContent
                      ? SmartPostLoadingView(
                          key: const ValueKey('loading'),
                          completedSteps: _completedSteps,
                          allDone: _loadingAllDone,
                        )
                      : Column(
                          key: const ValueKey('content'),
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              child: PostCard(
                                posts: _posts,
                                onPageChanged: (i) =>
                                    setState(() => _activePage = i),
                              ),
                            ),
                            CaptionSection(
                              caption: _posts[_activePage].caption,
                              onCaptionSaved: _onCaptionSaved,
                            ),
                            const SocialShareRow(),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const QuickShareBottomNav(),
    );
  }
}
