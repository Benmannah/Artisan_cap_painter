import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artisan_cap_painter/utils/app_colors.dart';
import '../../generated/assets.dart';
import '../../state_managers/navigation_state.dart';
import 'image_section.dart';
import 'service_details.dart';

class NewArtisanPage extends ConsumerWidget {
  const NewArtisanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        title: Image.asset(
          Assets.imagesLogoHT,
          height: 100,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: IndexedStack(
        index: ref.watch(newArtisanIndexProvider),
        children: const [ImagesSection(), ServiceDetails()],
      ),
    );
  }
}
