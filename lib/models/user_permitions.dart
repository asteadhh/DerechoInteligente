import '/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPermissionInfo {
  String admin;
  String chatSoporte;
  String estadisticas;
  String revenue;
  String informacionDeUsuario;
  String creditosMaestros;
  String onBoardingMaestro;
  String pagos;

  UserPermissionInfo({
    required this.admin,
    required this.chatSoporte,
    required this.estadisticas,
    required this.revenue,
    required this.informacionDeUsuario,
    required this.creditosMaestros,
    required this.onBoardingMaestro,
    required this.pagos,
  });

  Map<String, String> toJson() {
    return {
      FirestorePermitionsConstants.admin: admin,
      FirestorePermitionsConstants.chatSoporte: admin,
      FirestorePermitionsConstants.estadisticas: admin,
      FirestorePermitionsConstants.revenue: admin,
      FirestorePermitionsConstants.informacionDeUsuario: admin,
      FirestorePermitionsConstants.creditosMaestros: admin,
      FirestorePermitionsConstants.onBoardingMaestro: admin,
      FirestorePermitionsConstants.pagos: admin,
    };
  }

  factory UserPermissionInfo.fromDocument(DocumentSnapshot doc) {
    String admin = '';
    String chatSoporte = '';
    String estadisticas = '';
    String revenue = '';
    String informacionDeUsuario = '';
    String creditosMaestros = '';
    String onBoardingMaestro = '';
    String pagos = '';

    try {
      admin = doc.get(FirestorePermitionsConstants.admin);
    } catch (error) {}
    ;
    try {
      chatSoporte = doc.get(FirestorePermitionsConstants.chatSoporte);
    } catch (error) {}
    ;
    try {
      estadisticas = doc.get(FirestorePermitionsConstants.estadisticas);
    } catch (error) {}
    ;
    try {
      revenue = doc.get(FirestorePermitionsConstants.revenue);
    } catch (error) {}
    ;
    try {
      informacionDeUsuario =
          doc.get(FirestorePermitionsConstants.informacionDeUsuario);
    } catch (error) {}
    ;
    try {
      creditosMaestros = doc.get(FirestorePermitionsConstants.creditosMaestros);
    } catch (error) {}
    ;
    try {
      onBoardingMaestro =
          doc.get(FirestorePermitionsConstants.onBoardingMaestro);
    } catch (error) {}
    ;
    try {
      pagos = doc.get(FirestorePermitionsConstants.pagos);
    } catch (error) {}
    ;

    return UserPermissionInfo(
      admin: admin,
      chatSoporte: chatSoporte,
      estadisticas: estadisticas,
      revenue: revenue,
      informacionDeUsuario: informacionDeUsuario,
      creditosMaestros: creditosMaestros,
      onBoardingMaestro: onBoardingMaestro,
      pagos: pagos,
    );
  }
}
