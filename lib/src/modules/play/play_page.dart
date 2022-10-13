import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:knowledge_queezy/generated/assets.dart';
import 'package:knowledge_queezy/src/config/theme.dart';
import 'package:knowledge_queezy/src/data/local/shared_prefs.dart';
import 'package:knowledge_queezy/src/data/providers/providers.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/modules/play/play_notifier.dart';
import 'package:knowledge_queezy/src/modules/play/play_state.dart';
import 'package:knowledge_queezy/src/utils/dialogs.dart';
import 'package:knowledge_queezy/src/utils/snackbars.dart';
import 'package:knowledge_queezy/src/utils/widgets/app_error_widget.dart';
import 'package:knowledge_queezy/src/utils/widgets/background_container.dart';

class PlayArgs {
  final CategoryModel category;
  final String difficulty;

  const PlayArgs({
    required this.category,
    required this.difficulty,
  });
}

class PlayPage extends ConsumerStatefulWidget {
  const PlayPage({
    Key? key,
  }) : super(key: key);

  static const String routeName = "/play";

  @override
  ConsumerState createState() => _PlayPageState();
}

class _PlayPageState extends ConsumerState<PlayPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PlayArgs args = ModalRoute.of(context)?.settings.arguments as PlayArgs;
      ref.read(playProvider.notifier).init(category: args.category, difficulty: args.difficulty);
    });
  }

  void listenPlayStatus() {
    ref.listen<PlayStatus>(playProvider.select((value) => value.playStatus), (previous, next) {
      switch (next) {
        case PlayStatus.correct:
          showSnackBar(
            context,
            message: "Correct",
            backgroundColor: Colors.lightGreen,
            milliseconds: 1000,
          );
          break;
        case PlayStatus.inCorrect:
          showSnackBar(
            context,
            message: "Wrong",
            backgroundColor: Colors.redAccent,
            milliseconds: 1000,
          );
          break;
        case PlayStatus.gameOver:
          showAlertDialog(context,
              title: "Game Over",
              backgroundTitle: Colors.redAccent,
              subtitle: "You lose!",
              primaryActionText: "OK", primaryOnPressed: () {
            Navigator.pop(context);
          });
          break;
        case PlayStatus.complete:
          int score = ref.read(playProvider.notifier).getScore();
          showAlertDialog(
            context,
            title: "Congratulations",
            backgroundTitle: kPrimaryColor,
            subtitle: "You have completed the test!\nYour Score: $score",
            primaryActionText: "OK",
            primaryOnPressed: () async {
              Navigator.pop(context);
            },
          );
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenPlayStatus();
    PlayArgs args = ModalRoute.of(context)?.settings.arguments as PlayArgs;
    return BackgroundContainer(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(category: args.category.getName(), difficulty: args.difficulty),
              const SizedBox(
                height: 24,
              ),
              const Expanded(
                child: _PlayView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayView extends ConsumerWidget {
  const _PlayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlayStatus playStatus = ref.watch(playProvider.select((value) => value.playStatus));
    switch (playStatus) {
      case PlayStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case PlayStatus.loadError:
        return const AppErrorWidget();
      default:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _ScoreAndCoin(),
              SizedBox(
                height: 24,
              ),
              _IndexAndLife(),
              SizedBox(
                height: 10,
              ),
              _QuizQuestion(),
              SizedBox(
                height: 24,
              ),
              _AnswerList(),
              SizedBox(
                height: 36,
              ),
              _HelpAndSubmitButton(),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        );
    }
  }
}

class _HelpAndSubmitButton extends ConsumerWidget {
  const _HelpAndSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () async {
              if (!(await ref.read(playProvider.notifier).help())) {
                showSnackBar(
                  context,
                  message: "Not enough coin!",
                  backgroundColor: Colors.redAccent,
                );
              }
            },
            icon: Image.asset(
              Assets.imagesHelp,
              width: 32,
              height: 32,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(playProvider.notifier).submit();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width / 2.5, 44),
            ),
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}

class _AnswerList extends ConsumerWidget {
  const _AnswerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> answers = ref.watch(playProvider.select((value) => value.answers));
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _AnswerListItem(
          index: index,
          value: answers[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemCount: answers.length,
    );
  }
}

class _AnswerListItem extends ConsumerWidget {
  const _AnswerListItem({
    Key? key,
    required this.index,
    required this.value,
  }) : super(key: key);

  final int index;
  final String value;

  String getAnswerName() {
    switch (index) {
      case 0:
        return "A";
      case 1:
        return "B";
      case 2:
        return "C";
      default:
        return "D";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String answerSelected = ref.watch(playProvider.select((value) => value.answerSelected));
    String correctAnswer = ref.watch(playProvider.select((value) => value.correctAnswer));
    PlayStatus playStatus = ref.watch(playProvider.select((value) => value.playStatus));
    Color borderColor = Colors.white;
    if (playStatus == PlayStatus.answering) {
      if (value == answerSelected) {
        borderColor = Colors.blue;
      } else {
        borderColor = Colors.white;
      }
    } else if (playStatus == PlayStatus.correct) {
      if (value == correctAnswer) {
        borderColor = Colors.green;
      } else {
        borderColor = Colors.white;
      }
    } else if (playStatus == PlayStatus.inCorrect) {
      if (value == answerSelected) {
        borderColor = Colors.red;
      } else {
        borderColor = Colors.white;
      }
    }

    return InkWell(
      onTap: () => ref.read(playProvider.notifier).setAnswerSelected(value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2, color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Text(
              "${getAnswerName()}.",
              style: PrimaryFont.bold(fontSize: 18),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              HtmlUnescape().convert(value),
              style: PrimaryFont.regular(fontSize: 16),
            )),
          ],
        ),
      ),
    );
  }
}

class _QuizQuestion extends ConsumerWidget {
  const _QuizQuestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String question = ref.watch(playProvider.select((value) => value.question));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        HtmlUnescape().convert(question),
        style: PrimaryFont.medium(fontSize: 16).copyWith(
          height: 1.5,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _IndexAndLife extends ConsumerWidget {
  const _IndexAndLife({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(playProvider.select((value) => value.index));
    int life = ref.watch(playProvider.select((value) => value.life));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quiz: ${index + 1}",
            style: PrimaryFont.bold(fontSize: 18, color: kSecondaryColor)
                .copyWith(decoration: TextDecoration.underline),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              life,
              (index) => const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 28,
              ),
            ),
          ),
        ],
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
    int score = ref.watch(playProvider.select((value) => value.score));
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
                    Text(
                      score.toString(),
                      style: PrimaryFont.semiBold(fontSize: 18),
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
    required this.category,
    required this.difficulty,
  }) : super(key: key);

  final String category;
  final String difficulty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  category,
                  style: PrimaryFont.light(fontSize: 28),
                ),
                Text(
                  "Mode - $difficulty",
                  style: PrimaryFont.bold(fontSize: 22, color: kPrimaryColor),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showAlertDialog(
                context,
                title: "Exit?",
                backgroundTitle: Colors.redAccent,
                subtitle: "Are you sure?",
                primaryActionText: "OK",
                primaryOnPressed: () {
                  Navigator.pop(context);
                },
                secondaryActionText: "Cancel",
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
