import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constant/app_colors.dart';
import '../constant/app_images.dart';
import './status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String? loading;
  final double? loadingWidth;
  final double? loadingHeight;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget, this.loading, this.loadingWidth, this.loadingHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            color: AppColors.backgroundColor,
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child:
                  Lottie.asset(loading ?? AppImageAsset.loading,width:loadingWidth ?? 250 ,height: loadingHeight ?? 250),
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Container(
                color: AppColors.backgroundColor,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Lottie.asset(AppImageAsset.offLine,),
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Container(
                    color: AppColors.backgroundColor,
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Lottie.asset(AppImageAsset.server,),
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Container(
                        padding: const EdgeInsets.all(20.0),
                        color: AppColors.backgroundColor,
                        child: Center(
                          child: Lottie.asset(AppImageAsset.noData,
                              ),
                        ),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {

  final StatusRequest statusRequest;
  final Widget widget;
  final String? loading;
  final double? loadingWidth;
  final double? loadingHeight;

  const HandlingDataRequest({
    Key? key,
    required this.statusRequest,
    required this.widget, this.loading, this.loadingWidth, this.loadingHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            padding: const EdgeInsets.all(20.0),
            color: AppColors.backgroundColor,
            child: Center(
              child:
                  Lottie.asset( loading ?? AppImageAsset.loading,width:loadingWidth ?? 250 ,height: loadingHeight ?? 250),
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Container(
                padding: const EdgeInsets.all(20.0),
                color: AppColors.backgroundColor,
                child: Center(
                  child: Lottie.asset(AppImageAsset.offLine,
                      width: 250, height: 250),
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Container(
                    padding: const EdgeInsets.all(20.0),
                    color: AppColors.backgroundColor,
                    child: Center(
                      child: Lottie.asset(AppImageAsset.server,
                          width: 250, height: 250),
                    ),
                  )
                : widget;
  }
}
