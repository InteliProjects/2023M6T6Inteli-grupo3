import 'dart:io';

import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:luis_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:luis_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class TirarFotoEntregadorScreen extends StatefulWidget {
  const TirarFotoEntregadorScreen({Key? key}) : super(key: key);

  @override
  _TirarFotoEntregadorScreenState createState() =>
      _TirarFotoEntregadorScreenState();
}

class _TirarFotoEntregadorScreenState extends State<TirarFotoEntregadorScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Inicializa a câmera
    _controller = CameraController(
      // Use a função 'firstCamera' do pacote 'camera' para obter a câmera traseira
      CameraDescription(
        name: '0',
        lensDirection: CameraLensDirection.back, sensorOrientation: 0,
      ),
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Certifique-se de descartar o controlador quando ele não for mais necessário
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
        return Scaffold(
            appBar: _buildAppBar(context),
            body: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Se a inicialização estiver concluída, exibe a visualização da câmera
                return CameraPreview(_controller);
              } else {
                // Caso contrário, exibe um indicador de carregamento
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _takePicture(context);
                },
                child: CustomImageView(
                  imagePath: ImageConstant.imgComponent92,
                  height: 79,
                  width: 79,
                ),
              ),
                  SizedBox(height: 18.v),
                  Text("Tirar foto",
                      style: CustomTextStyles.titleLargeBlack900_1)
            ],
          ),
        ],
      ),
    );
  }


PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 69.h,
    leading: AppbarLeadingImage(
      imagePath: ImageConstant.img211621CRightArrowIconOnprimary,
      margin: EdgeInsets.only(left: 39.h, top: 12.v, bottom: 10.v),
      onTap: () {
        onTapImage(context);
      },
    ),
    centerTitle: true,
    title: Container(
      height: 27.v,
      width: 150.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppbarSubtitle(
            text: "Registrar nota",
            margin: EdgeInsets.only(bottom: 2.v),
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

  /// Navega para a tela entregaEmAndamentoEntregadorScreen quando a ação é acionada.
  onTapImage(BuildContext context) {
    Navigator.pop(context);
  }

Future<void> _takePicture(BuildContext context) async {
  try {
    // Aguarda até que a câmera esteja pronta
    await _initializeControllerFuture;

    // Tira a foto
    final picture = await _controller.takePicture();

    // Obtém o diretório onde a foto será salva
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final folderPath = '${appDocumentsDirectory.path}/minha_pasta_de_fotos';

    // Certifica de que a pasta exista, se não, cria ela
    await Directory(folderPath).create(recursive: true);

    // Constrói o novo caminho com o nome do arquivo
    final newPicturePath = '$folderPath/foto_${DateTime.now().millisecondsSinceEpoch}.png';

    // Move o arquivo para o novo caminho
    await File(picture.path).rename(newPicturePath);

    // Salva o arquivo na galeria de fotos
    await GallerySaver.saveImage(newPicturePath);

    // Navega para a próxima tela
    Navigator.pushNamed(context, AppRoutes.entregaEmAndamentoEntregadorScreen);
  } catch (e) {
    print('Erro ao tirar foto: $e');
  }
}

}

