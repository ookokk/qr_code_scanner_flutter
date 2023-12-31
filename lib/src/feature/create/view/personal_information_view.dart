import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/cache/cache_manager.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/viewmodel/qr_create_helper.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/widget/build_show_dialog.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/widget/custom_text_field.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/widget/please_card.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/widget/show_dialog_btn.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/model/custom_app_bar.dart';

class PersonalInformationView extends ConsumerWidget {
  PersonalInformationView({
    Key? key,
  }) : super(key: key);
  final TextEditingController nameCnt = TextEditingController();
  final TextEditingController jobCnt = TextEditingController();
  final TextEditingController phoneCnt = TextEditingController();
  final TextEditingController emailCnt = TextEditingController();
  final TextEditingController addressCnt = TextEditingController();
  final TextEditingController websiteCnt = TextEditingController();
  final TextEditingController linkedinCnt = TextEditingController();
  final QRCreateHelper qrHelper = QRCreateHelper();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
            appBar: const CustomAppBar(
              title: "",
            ),
            backgroundColor: currentTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  const PleaseCard(),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: nameCnt,
                      hintText: "nameSurname".tr(),
                      icon: Icon(
                        Icons.perm_contact_cal_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: jobCnt,
                      hintText: "job".tr(),
                      icon: Icon(
                        Icons.business_center,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: phoneCnt,
                      hintText: "phone".tr(),
                      icon: Icon(
                        Icons.local_phone,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: emailCnt,
                      hintText: "email".tr(),
                      icon: Icon(
                        Icons.email_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: addressCnt,
                      hintText: "address".tr(),
                      icon: Icon(
                        Icons.business_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: websiteCnt,
                      hintText: "website".tr(),
                      icon: Icon(
                        Icons.http,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: linkedinCnt,
                      hintText: "linkedin".tr(),
                      icon: Icon(
                        Icons.insert_link,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  ShowDialogBtn(
                    text: "save".tr(),
                    onTap: () {
                      BuildShowDialog().buildShowDialog(context, currentTheme);
                      loadSavedData();
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: currentTheme.shadowColor,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "ifYouEnteredAlready".tr(),
                    style: currentTheme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  ShowDialogBtn(
                    text: "goTo".tr(),
                    onTap: () {
                      Navigator.pushNamed(context, '/qrCreate');
                    },
                  )
                ],
              ),
            )));
  }

  void loadSavedData() async {
    final cache = CacheManager();
    cache.setCustomData('name', nameCnt.text);
    cache.setCustomData('job', jobCnt.text);
    cache.setCustomData('phone', phoneCnt.text);
    cache.setCustomData('email', emailCnt.text);
    cache.setCustomData('address', addressCnt.text);
    cache.setCustomData('website', websiteCnt.text);
    cache.setCustomData('linkedin', linkedinCnt.text);
  }
}
