import 'package:flutter/material.dart';
import 'package:luis_s_application/core/app_export.dart';

class TelaprincipalseducescolasdadosItemWidget extends StatelessWidget {
  final String titulo;
  final int quantidade;
  final int total;

  const TelaprincipalseducescolasdadosItemWidget({
    Key? key,
    required this.titulo,
    required this.quantidade,
    required this.total,
  }) : super(key: key);

    Color _getTextColor(String titulo) {
    switch (titulo) {
      case 'Pendente':
        return const Color.fromARGB(255, 255, 186, 59);
      case 'Em andamento':
        return Colors.blue;
        case 'Entregue':
        return Colors.green;
      case 'Concluídas':
        return Colors.green.shade900;
      default:
        return Colors.grey; // Uma cor padrão para outros casos, se houver
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obtém a cor do texto com base no título
    Color textColor = _getTextColor(titulo);

    return Center(
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Cor da borda padrão
          borderRadius: BorderRadius.circular(5.h),
          // Outras propriedades de decoração conforme necessário
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor, // Define a cor do texto
                // Outros estilos conforme necessário
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 9.v, width: 200),
            Text(
              '${quantidade}' + "/" + total.toString(),
              style: CustomTextStyles.bodyMediumRobotoBlack900.copyWith(
                fontSize: 20.h,
              ),
              textAlign: TextAlign.center,
            ),
            // Outros widgets conforme necessário
          ],
        ),
      ),
    );
  }
}

