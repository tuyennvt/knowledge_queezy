import 'package:flutter/material.dart';
import 'package:knowledge_queezy/src/config/strings.dart';
import 'package:knowledge_queezy/src/config/theme.dart';

Future<void> showLoadingFullscreenDialog(BuildContext context) async {
  await showGeneralDialog(
    context: context,
    barrierColor: Colors.black38,
    pageBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Container(
        color: Colors.black38,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    },
  );
}

Future<void> showAlertDialog(
  BuildContext context, {
  required String title,
  required String? subtitle,
  Color? backgroundTitle,
  required String primaryActionText,
  String? secondaryActionText,
  VoidCallback? primaryOnPressed,
  VoidCallback? secondaryOnPressed,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _MyAlertDialog(
          title: title,
          backgroundTitle: backgroundTitle,
          subtitle: subtitle ?? AppStrings.unknownError,
          primaryActionText: primaryActionText,
          secondaryActionText: secondaryActionText,
          primaryOnPressed: primaryOnPressed,
          secondaryOnPressed: secondaryOnPressed,
        );
      },
      barrierDismissible: false);
}

class _MyAlertDialog extends StatelessWidget {
  const _MyAlertDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    this.backgroundTitle,
    required this.primaryActionText,
    this.secondaryActionText,
    this.primaryOnPressed,
    this.secondaryOnPressed,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final Color? backgroundTitle;
  final String primaryActionText;
  final String? secondaryActionText;
  final VoidCallback? primaryOnPressed;
  final VoidCallback? secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundTitle ?? kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                title,
                style: PrimaryFont.medium(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: PrimaryFont.regular(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: kTextColor,
              height: 0.5,
            ),
            if (secondaryActionText == null) ...{
              _SingleActionDialog(
                label: primaryActionText,
                onPressed: () {
                  Navigator.pop(context);
                  primaryOnPressed?.call();
                },
              )
            } else ...{
              _DoubleActionDialog(
                primaryActionText: primaryActionText,
                secondaryActionText: secondaryActionText!,
                primaryOnPressed: () {
                  Navigator.pop(context);
                  primaryOnPressed?.call();
                },
                secondaryOnPressed: () {
                  Navigator.pop(context);
                  secondaryOnPressed?.call();
                },
              )
            }
          ],
        ),
      ),
    );
  }
}

class _SingleActionDialog extends StatelessWidget {
  const _SingleActionDialog({Key? key, required this.label, this.onPressed}) : super(key: key);
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 44,
      child: InkWell(
        onTap: () => onPressed?.call(),
        child: Center(
          child: Text(
            label,
            style: PrimaryFont.semiBold(
              fontSize: 16,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}

class _DoubleActionDialog extends StatelessWidget {
  const _DoubleActionDialog({
    Key? key,
    required this.primaryActionText,
    required this.secondaryActionText,
    this.primaryOnPressed,
    this.secondaryOnPressed,
  }) : super(key: key);
  final String primaryActionText;
  final String secondaryActionText;
  final VoidCallback? primaryOnPressed;
  final VoidCallback? secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => secondaryOnPressed?.call(),
            child: SizedBox(
              height: 44,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  secondaryActionText,
                  style: PrimaryFont.regular(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: kTextColor,
          width: 0.5,
          height: 44,
        ),
        Expanded(
          child: InkWell(
            onTap: () => primaryOnPressed?.call(),
            child: SizedBox(
              height: 44,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  primaryActionText,
                  style: PrimaryFont.semiBold(
                    fontSize: 16,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
