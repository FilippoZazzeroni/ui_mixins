
import 'package:ui_mixins/mixins/loadble/error_dialog.dart';
import 'package:ui_mixins/mixins/loadble/loading_dialog.dart';
import 'package:ui_mixins/mixins/loadble/success_dialog.dart';
import 'package:ui_mixins/mixins/loadble/loading_data.dart';

import 'dialog_type.dart';

class DialogFactory {

  LoadingDialog create(LoadingData data) {
    switch (data.type) {
      case DialogType.loading:
        return const LoadingDialog();
      case DialogType.success:
        return SuccessfulDialog(asset: data.asset!);
      case DialogType.error:
        return ErrorDialog(data: data);
    }
  }

}