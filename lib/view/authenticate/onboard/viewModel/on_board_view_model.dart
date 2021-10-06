import 'package:covid_mobil/core/base/model/base_view_model.dart';
import 'package:covid_mobil/core/init/lang/locale_keys.dart';
import 'package:covid_mobil/view/authenticate/onboard/model/on_board_model.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  PageController controller = PageController(initialPage: 0);

  @action
  void changeCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }
  @override
  void init() {
    onBoardItems.add(
      OnBoardModel(LocalKeys.onBoardUrl1, LocalKeys.onBoardTitle1,
          LocalKeys.onBoardContext1),
    );
    onBoardItems.add(OnBoardModel(LocalKeys.onBoardUrl2,
        LocalKeys.onBoardTitle2, LocalKeys.onBoardContext2));
    onBoardItems.add(OnBoardModel(LocalKeys.onBoardUrl3,
        LocalKeys.onBoardTitle3, LocalKeys.onBoardContext3));
  }
}
