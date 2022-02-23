
import 'package:ui_mixins/mixins/loadble/loading_dialog.dart';
import 'package:ui_mixins/mixins/loadble/success_dialog.dart';

import 'dialog_type.dart';

class DialogFactory {

  LoadingDialog create(DialogType type) {
    switch (type) {
      case DialogType.loading:
        return const LoadingDialog();
      case DialogType.success:
        return const SuccessfulDialog();
    }
  }

}