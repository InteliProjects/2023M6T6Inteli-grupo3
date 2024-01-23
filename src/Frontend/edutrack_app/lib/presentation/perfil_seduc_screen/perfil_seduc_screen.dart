import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/presentation/perfil_seduc_screen/widgets/perfilseduc_item_widget.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:luis_s_application/widgets/custom_bottom_app_bar_seduc.dart';
import 'package:luis_s_application/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilSeducScreen extends StatefulWidget {
  PerfilSeducScreen({Key? key}) : super(key: key);

  @override
  _PerfilSeducScreenState createState() => _PerfilSeducScreenState();
}

class _PerfilSeducScreenState extends State<PerfilSeducScreen> {
  TextEditingController schoolController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  String predictionResult = '';
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // Initialize SharedPreferences in the initState method
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Set the initial value for schoolController and supplierController
    schoolController.text = prefs.getString('schoolName') ?? '';
    supplierController.text = prefs.getString('supplierName') ?? '';
    // Force a rebuild of the widget after SharedPreferences is initialized
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 11.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                      bottom: 10.v,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgInteliInstit,
                          height: 134.v,
                          width: 160.h,
                        ),
                        SizedBox(height: 10.v),
                        Center(
                        child: Text(
                          "Perfil Seduc",
                          style: theme.textTheme.bodyMedium,
                        ),
                        ),
                        SizedBox(height: 5.v),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.img8Email,
                                  height: 12.v,
                                  width: 18.h,
                                  margin: EdgeInsets.only(
                                    top: 1.v,
                                    bottom: 3.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    prefs.getString('emailSeduc') ?? "Relogue para ver o e-mail",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 37.v),
                        _buildPerfilFornecedor(context),
                        SizedBox(height: 30.v),
                        _buildComponentFiftyThree(context),
                        SizedBox(height: 20.v),
                        TextField(
                          controller: schoolController,
                          style: CustomTextStyles.bodyMediumPoppins,
                          decoration: InputDecoration(
                            hintText: 'Nome da Escola',
                            hintStyle: TextStyle(color: Colors.grey[450]),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.blueAccent, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        TextField(
                          controller: supplierController,
                          style: CustomTextStyles.bodyMediumPoppins,
                          decoration: InputDecoration(
                            hintText: 'Nome do Fornecedor',
                            hintStyle: TextStyle(color: Colors.grey[450]),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.blueAccent, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.v),
                        CustomElevatedButton(
                            rightIcon: Icon(Icons.troubleshoot),
                            text: "Realizar predição de nota".toUpperCase(),
                            buttonStyle:
                                CustomButtonStyles.fillSecondaryContainerTL18,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallOnPrimary_1,
                            onPressed: () {
                              sendPostRequest();
                            },
                            alignment: Alignment.center),
                        SizedBox(height: 20.v),

                        // Exibir o resultado da previsão
                        Card(
                            surfaceTintColor: Colors.grey[900],
                            elevation: 4.0,
                            child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(children: [
                                  Text(
                                    'Resultado da Previsão: $predictionResult',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ])))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
          margin: EdgeInsets.only(
            left: 39.h,
            top: 12.v,
            bottom: 10.v,
          ),
          onTap: () {
            onTapImage(context);
          }),
      centerTitle: true,
      title: SizedBox(
        height: 31.000004.v,
        width: 56.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.v),
                child: Text(
                  "Perfil",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.fromLTRB(40.h, 15.v, 40.h, 13.v),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img352510LocalPhoneIcon,
            height: 16.adaptSize,
            width: 16.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "11 92367-8843",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Spacer(),
          Text(
            "CNPJ: 4533743252/100",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPerfilFornecedor(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 30.v,
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return null;
      },
    );
  }

Widget _buildComponentFiftyThree(BuildContext context) {
  double predictedRating = 0.0;

  try {
    predictedRating = double.parse(predictionResult);
  } catch (e) {
    // Handle the case where predictionResult is not a valid double
    print('Error parsing predictionResult: $e');
  }

  double topPercentage = (predictedRating / 100) * 20;
  double bottomPercentage = 1 - topPercentage;

  return Container(
    width: 320.h,
    padding: EdgeInsets.symmetric(
      horizontal: 8.h,
      vertical: 14.v,
    ),
    decoration: AppDecoration.outlineBlack.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder5,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: Text(
              "Predição da avaliação da escola",
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Padding(
          padding: EdgeInsets.only(left: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUp,
                height: 20.v,
                width: 23.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 7.v,
                    bottom: 4.v,
                  ),
                  child: Container(
                    height: 10.v,
                    width: 218.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        5.h,
                      ),
                    ),
                    child: LinearProgressIndicator(
                      value: topPercentage,
                      backgroundColor: appTheme.blueGray100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  top: 3.v,
                ),
                child: Text(
                  "${predictedRating * 20}%",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.v),
        Padding(
          padding: EdgeInsets.only(
            left: 13.h,
            right: 4.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgSearchBlack900,
                height: 20.v,
                width: 23.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 4.v,
                    bottom: 6.v,
                  ),
                  child: Container(
                    height: 10.v,
                    width: 218.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        5.h,
                      ),
                    ),
                    child: LinearProgressIndicator(
                      value: predictedRating != 0 ? bottomPercentage : 0,
                      backgroundColor: appTheme.blueGray100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        appTheme.black900,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  bottom: 2.v,
                ),
                child: Text(
                  "${predictedRating != 0 ? "${100 - (predictedRating * 20)}" : "0"}%",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 7.v),
      ],
    ),
  );
}


  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBarSeduc(
      onChanged: (BottomBarEnum type) {
        if (type == BottomBarEnum.Perfil) {
          Navigator.of(context).pushNamed(AppRoutes.perfilSeducScreen);
        }
      },
    );
  }

  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> sendPostRequest() async {
    final String url = 'http://ec2-35-170-5-155.compute-1.amazonaws.com:4000/predict';

    final Map<String, String> data = {
      'school_name': schoolController.text ?? '',
      'supplier_name': supplierController.text ?? '',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? result = jsonDecode(response.body);

        if (result != null && result.containsKey('predicted_rating')) {
          final double predictedRating = result['predicted_rating'];
          setState(() {
            predictionResult = predictedRating.toString();
          });
          print('Resposta da Requisição: $predictedRating');
          // Aqui você pode usar o valor de predictedRating conforme necessário
        } else {
          print('Resposta inválida do servidor');
        }
      } else {
        print('Erro na Requisição: ${response.statusCode}');
        // Tratar erros na resposta da requisição
      }
    } catch (error) {
      print('Erro de Conexão: $error');
      // Lidar com erros de conexão
    }
  }
}
