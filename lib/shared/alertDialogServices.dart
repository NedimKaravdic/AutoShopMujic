import 'package:Quiz_App/screens/ExtraLifeScreen.dart';
import 'package:Quiz_App/screens/spendExtraLives.dart';
import 'package:Quiz_App/screens/victoryDialog.dart';
import 'package:flutter/material.dart';
import 'package:Quiz_App/screens/tryAgainDialog.dart';
import 'package:Quiz_App/screens/cloudDialog.dart';
import 'package:Quiz_App/screens/loadingCloudDialog.dart';

bool isPoppable = false;

showAlertDialogFunc(
  BuildContext context,
  bool isCancelable,
  int score,
  Function function,
) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
          child: ExtraLifeScreen(
            isCancelable: isCancelable,
            score: score,
            restart: function,
          ),
        );
      });
}

extraLifesDialog(BuildContext context, bool isCancelable, int screenScore,
    Function restart, Function resume) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
          child: SpendExtraLives(
            isCancelable: isCancelable,
            screenScore: screenScore,
            restart: restart,
            isPoppable: isPoppable,
            resume: resume,
          ),
        );
      }).then((value) {
    if (isPoppable = false) {
      Navigator.of(context).pop();
    }
  });
}

Future tryAgainDialog(BuildContext context, bool isCancelable, int screenScore,
    Function restart) {
  //isPopable = false;
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Color(0xffa33135),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:
                    BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
            child: TryAgainDialog(
              isCancelable: isCancelable,
              screenScore: screenScore,
              restart: restart,
              isPoppable: isPoppable,
            ));
      }).then((value) {
    if (isPoppable = false) {
      Navigator.of(context).pop();
    }
  });
}

Future victoryDialog(BuildContext context, bool isCancelable, int screenScore,
    Function restart, int answeredCorrectly) {
  //isPopable = false;
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.blue[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:
                    BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
            child: VictoryDialog(
              isCancelable: isCancelable,
              screenScore: screenScore,
              restart: restart,
              isPoppable: isPoppable,
              answeredCorrectly: answeredCorrectly,
            ));
      }).then((value) {
    if (isPoppable = false) {
      // Navigator.of(context).pop();
    }
  });
}

cloudsDialog(BuildContext context, bool isLoading) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
          child: CloudsDialog(dialogContext, isLoading),
        );
      });
}

loadingCloudsDialog(BuildContext context, bool isLoading) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 4, color: Colors.black.withOpacity(0.7))),
          child: LoadingCloudsDialog(dialogContext, isLoading),
        );
      });
}
