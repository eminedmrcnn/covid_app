import 'package:covid_mobil/constants/constants_init.dart';
import 'package:covid_mobil/core/base/widget/base_widget.dart';
import 'package:covid_mobil/core/extension/context_extension.dart';
import 'package:covid_mobil/view/authenticate/onboard/viewModel/on_board_view_model.dart';
import 'package:covid_mobil/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        backgroundColor: customColors.white,
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              SizedBox(
                height: context.height * .04,
              ),
              Expanded(
                child: PageView.builder(
                  controller: viewModel.controller,
                  itemCount: viewModel.onBoardItems.length,
                  onPageChanged: (index) {
                    viewModel.changeCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Lottie.asset(
                          viewModel.onBoardItems[index].url,
                          width: context.width / 1.5,
                        ),
                        Text(viewModel.onBoardItems[index].title,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: context.height * .02,
                        ),
                        Text(
                          viewModel.onBoardItems[index].context,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  viewModel.onBoardItems.length,
                  (index) => Observer(builder: (context) {
                    return Container(
                      height: viewModel.currentIndex == index ? 15 : 10,
                      width: viewModel.currentIndex == index ? 15 : 10,
                      margin: EdgeInsets.only(right: 5, bottom: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: customColors.buttonColor,
                      ),
                    );
                  }),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10.0),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: customColors.buttonColor,
                    ),
                    onPressed: () {
                      if (viewModel.currentIndex ==
                          viewModel.onBoardItems.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      }
                      viewModel.nextPage();
                    },
                    child: Text(
                      viewModel.currentIndex ==
                              viewModel.onBoardItems.length - 1
                          ? customStrings.continuee
                          : customStrings.next,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
