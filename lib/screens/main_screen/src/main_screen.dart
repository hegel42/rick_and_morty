import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/main_app_bar.dart';
import '../../../common/widgets/main_app_field.dart';
import '../../../common/widgets/shimmer_placeholder.dart';
import 'bloc/home_screen_bloc.dart';
import 'components/character_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: '',
        needBackButton: false,
        bottom: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: MainAppTextField(
            controller: _controller,
            hintText: 'Search characters...',
            suffixWidget: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.search_outlined),
            ),
            onSubmitted: (value) {
              context
                  .read<HomeScreenBloc>()
                  .add(InitFetchEvent(searchQuery: value));
            },
          ),
        ),
      ),
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {},
        buildWhen: (previous, current) =>
            current is HomeScreenLoading || current is HomeScreenDataState,
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return ListView.separated(
              itemCount: 3,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => ShimmerPlaceholder(
                isEnabled: true,
                child: SizedBox(
                  height: 96,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
            );
          }
          if (state is HomeScreenDataState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeScreenBloc>().add(InitFetchEvent());
                _controller.clear();
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) {
                  if (scrollInfo.metrics is! PageMetrics) {
                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      context.read<HomeScreenBloc>().add(FetchNext());
                    }
                  }
                  return false;
                },
                child: ListView.separated(
                  itemCount: state.characters.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return CharacterCard(
                      character: state.characters[index],
                    );
                  },
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
