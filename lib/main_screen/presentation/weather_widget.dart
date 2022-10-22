import 'package:example/core/presentation/app_padding.dart';
import 'package:example/core/presentation/app_text.dart';
import 'package:example/weather/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherWidget extends ConsumerStatefulWidget {
  const WeatherWidget({super.key});

  @override
  ConsumerState<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends ConsumerState<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherStateNotifierProvider);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: weatherState.map(
          initial: (_) => const [SizedBox()],
          loading: (_) => const [CircularProgressIndicator()],
          done: (_) => [
            if (_.weather.degree > 18) const Icon(Icons.wb_sunny_outlined, size: 100),
            if (_.weather.degree < 18)
              const Icon(Icons.water_drop_outlined, size: 100),
            AppPadding().appSmallVerticalPadding,
            AppText(
              '${_.weather.location}\n${_.weather.degree}°C ',
            ),
          ],
          failed: (_) => [
            const Icon(
              Icons.error_outline,
              size: 100,
            ),
            AppPadding().appSmallVerticalPadding,
            AppText(_.errorMessage),
          ],
        ),
      ),
    );
  }
}
