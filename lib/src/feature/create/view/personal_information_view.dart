import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/cache/cache_manager.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
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
                      hintText: Strings.nameSurname,
                      icon: Icon(
                        Icons.perm_contact_cal_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: jobCnt,
                      hintText: Strings.job,
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
                      hintText: Strings.phone,
                      icon: Icon(
                        Icons.local_phone,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: emailCnt,
                      hintText: Strings.email,
                      icon: Icon(
                        Icons.email_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: addressCnt,
                      hintText: Strings.address,
                      icon: Icon(
                        Icons.business_outlined,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: websiteCnt,
                      hintText: Strings.website,
                      icon: Icon(
                        Icons.http,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: linkedinCnt,
                      hintText: Strings.linkedin,
                      icon: Icon(
                        Icons.insert_link,
                        color: currentTheme.indicatorColor,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  ShowDialogBtn(
                    onTap: () {
                      BuildShowDialog().buildShowDialog(context, currentTheme);
                      loadSavedData();
                    },
                  ),
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
