import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/generated/assets.dart';
import 'package:knowledge_queezy/src/config/theme.dart';
import 'package:knowledge_queezy/src/data/providers/providers.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/modules/main/main_notifier.dart';
import 'package:knowledge_queezy/src/modules/play/play_page.dart';
import 'package:knowledge_queezy/src/utils/widgets/app_empty_widget.dart';
import 'package:knowledge_queezy/src/utils/widgets/app_error_widget.dart';
import 'package:knowledge_queezy/src/utils/widgets/background_container.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String routeName = "/";

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(mainProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                _Header(),
                SizedBox(
                  height: 16,
                ),
                _ScoreAndCoin(),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 222,
                  child: _CategoryList(),
                ),
                SizedBox(
                  height: 32,
                ),
                _Difficulty(),
                SizedBox(
                  height: 16,
                ),
                _PlayButton(),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends ConsumerWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? categorySelected =
        ref.watch(mainProvider.select((value) => value.categorySelected));
    String? difficulty = ref.watch(mainProvider.select((value) => value.difficulty));
    bool disable = categorySelected == null || difficulty == null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton.icon(
        onPressed: disable
            ? null
            : () {
                Navigator.pushNamed(
                  context,
                  PlayPage.routeName,
                  arguments: PlayArgs(category: categorySelected, difficulty: difficulty),
                );
              },
        icon: const Icon(Icons.play_arrow_rounded),
        label: const Text("Play now"),
      ),
    );
  }
}

class _Difficulty extends ConsumerWidget {
  const _Difficulty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Choose Difficulty",
            style: PrimaryFont.semiBold(fontSize: 16),
          ),
          const _DifficultyItem("Easy"),
          const _DifficultyItem("Medium"),
          const _DifficultyItem("Hard"),
        ],
      ),
    );
  }
}

class _DifficultyItem extends ConsumerWidget {
  const _DifficultyItem(
    this.value, {
    Key? key,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? difficulty = ref.watch(mainProvider.select((value) => value.difficulty));
    return GestureDetector(
      onTap: () => ref.read(mainProvider.notifier).setDifficulty(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: double.maxFinite,
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: difficulty,
              onChanged: (value) => ref.read(mainProvider.notifier).setDifficulty(value!),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                value,
                style: PrimaryFont.regular(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Choose Category",
            style: PrimaryFont.semiBold(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ref.watch(mainProvider.select((value) => value.categories)).when(
            data: (List<CategoryModel> data) {
              if (data.isEmpty) {
                return const AppEmptyWidget();
              }
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  CategoryModel category = data[index];
                  return _CategoryListItem(category);
                },
                itemCount: data.length,
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (Object error, StackTrace stackTrace) {
              return AppErrorWidget(
                error: error.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryListItem extends ConsumerWidget {
  const _CategoryListItem(
    this.category, {
    Key? key,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? categorySelected =
        ref.watch(mainProvider.select((value) => value.categorySelected));
    Color textColor = categorySelected?.id == category.id ? Colors.white : kTextColor;
    Color bgColor = categorySelected?.id == category.id ? kPrimaryColor : kBackgroundColor;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => ref.read(mainProvider.notifier).setCategorySelected(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: kPrimaryColor),
          color: bgColor,
        ),
        child: Text(
          category.getName(),
          style: PrimaryFont.medium(fontSize: 16, color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _ScoreAndCoin extends ConsumerWidget {
  const _ScoreAndCoin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesScore,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Score",
                      style: PrimaryFont.regular(fontSize: 16),
                    ),
                    ref.watch(scoreProvider).when(
                      data: (int data) {
                        return Text(
                          data.toString(),
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                      error: (Object error, StackTrace stackTrace) {
                        return Text(
                          "0",
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                      loading: () {
                        return Text(
                          "0",
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesCoin,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Coin",
                      style: PrimaryFont.regular(fontSize: 16),
                    ),
                    ref.watch(coinProvider).when(
                      data: (int data) {
                        return Text(
                          data.toString(),
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                      error: (Object error, StackTrace stackTrace) {
                        return Text(
                          "0",
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                      loading: () {
                        return Text(
                          "0",
                          style: PrimaryFont.semiBold(fontSize: 18),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Welcome to",
            style: PrimaryFont.regular(fontSize: 24),
          ),
          Text(
            "Knowledge Queezy",
            style: PrimaryFont.bold(fontSize: 32, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
