import '/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatInfo {
  String id;
  String nickname;
  String aboutMe;
  var uid;
  var createdOn;
  var modifiedOn;
  var lastLogInOn;
  var nombre;
  var correo;
  var maestro;
  var dirrecciones;
  var antecedentes;
  var foto;
  var primerApellido;
  var segundoApellido;
  var rut;
  var numeroDeSerie;
  var estadoDeChat;
  var acumuladoRatingUsuario;
  var cantiadadTrabajosUsuario;
  var acumuladoRatingMaestro;
  var cantiadadTrabajosMaestro;
  var genero;
  var cumpleanos;
  var phone;
  var iniciado;
  var status;
  var numeroTelefono;
  UserChatInfo({
    required this.id,
    required this.aboutMe,
    required this.nickname,
    required this.uid,
    required this.createdOn,
    required this.modifiedOn,
    required this.lastLogInOn,
    required this.nombre,
    required this.correo,
    required this.maestro,
    required this.dirrecciones,
    required this.antecedentes,
    required this.foto,
    required this.primerApellido,
    required this.segundoApellido,
    required this.rut,
    required this.numeroDeSerie,
    required this.estadoDeChat,
    required this.acumuladoRatingUsuario,
    required this.cantiadadTrabajosUsuario,
    required this.acumuladoRatingMaestro,
    required this.cantiadadTrabajosMaestro,
    required this.genero,
    required this.cumpleanos,
    required this.phone,
    required this.iniciado,
    required this.status,
    required this.numeroTelefono,
  });
  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.foto: foto,
      FirestoreConstants.numeroTelefono: numeroTelefono,
      FirestoreConstants.uid: uid,
      FirestoreConstants.createdOn: createdOn,
      FirestoreConstants.modifiedOn: modifiedOn,
      FirestoreConstants.lastLogInOn: lastLogInOn,
      FirestoreConstants.nombre: nombre,
      FirestoreConstants.correo: correo,
      FirestoreConstants.maestro: maestro,
      FirestoreConstants.dirrecciones: dirrecciones,
      FirestoreConstants.antecedentes: antecedentes,
      FirestoreConstants.primerApellido: primerApellido,
      FirestoreConstants.segundoApellido: segundoApellido,
      FirestoreConstants.rut: rut,
      FirestoreConstants.numeroDeSerie: numeroDeSerie,
      FirestoreConstants.estadoDeChat: estadoDeChat,
      FirestoreConstants.acumuladoRatingUsuario: acumuladoRatingUsuario,
      FirestoreConstants.cantiadadTrabajosUsuario: cantiadadTrabajosUsuario,
      FirestoreConstants.acumuladoRatingMaestro: acumuladoRatingMaestro,
      FirestoreConstants.cantiadadTrabajosMaestro: cantiadadTrabajosMaestro,
      FirestoreConstants.genero: genero,
      FirestoreConstants.cumpleanos: cumpleanos,
      FirestoreConstants.phone: phone,
      FirestoreConstants.iniciado: iniciado,
      FirestoreConstants.status: status,
    };
  }

  factory UserChatInfo.fromDocument(DocumentSnapshot doc) {
    String aboutMe = '';
    String nickname = '';
    var uid = '';
    var createdOn = '';
    var modifiedOn = '';
    var lastLogInOn = '';
    var nombre = '';
    var correo = '';
    var maestro = '';
    var dirrecciones = '';
    var antecedentes = '';
    var primerApellido = '';
    var segundoApellido = '';
    var rut = '';
    var numeroDeSerie = '';
    var estadoDeChat = '';
    var acumuladoRatingUsuario = '';
    var cantiadadTrabajosUsuario = '';
    var acumuladoRatingMaestro = '';
    var cantiadadTrabajosMaestro = '';
    var genero = '';
    var cumpleanos = '';
    var phone = '';
    var iniciado = '';
    var status = '';
    var numeroTelefono = '';
    var foto = '';
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (error) {}
    ;
    try {
      foto = doc.get(FirestoreConstants.foto);
    } catch (error) {}
    ;
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (error) {}
    ;
    try {
      numeroTelefono = doc.get(FirestoreConstants.numeroTelefono);
    } catch (error) {}
    ;
    try {
      uid = doc.get(FirestoreConstants.uid);
    } catch (error) {}
    ;
    try {
      createdOn = doc.get(FirestoreConstants.createdOn);
    } catch (error) {}
    ;
    try {
      modifiedOn = doc.get(FirestoreConstants.modifiedOn);
    } catch (error) {}
    ;
    try {
      lastLogInOn = doc.get(FirestoreConstants.lastLogInOn);
    } catch (error) {}
    ;
    try {
      nombre = doc.get(FirestoreConstants.nombre);
    } catch (error) {}
    ;
    try {
      correo = doc.get(FirestoreConstants.correo);
    } catch (error) {}
    ;
    try {
      maestro = doc.get(FirestoreConstants.maestro);
    } catch (error) {}
    ;
    try {
      dirrecciones = doc.get(FirestoreConstants.dirrecciones);
    } catch (error) {}
    ;
    try {
      antecedentes = doc.get(FirestoreConstants.antecedentes);
    } catch (error) {}
    ;
    try {
      primerApellido = doc.get(FirestoreConstants.primerApellido);
    } catch (error) {}
    ;
    try {
      segundoApellido = doc.get(FirestoreConstants.segundoApellido);
    } catch (error) {}
    ;
    try {
      rut = doc.get(FirestoreConstants.rut);
    } catch (error) {}
    ;
    try {
      numeroDeSerie = doc.get(FirestoreConstants.numeroDeSerie);
    } catch (error) {}
    ;
    try {
      estadoDeChat = doc.get(FirestoreConstants.estadoDeChat);
    } catch (error) {}
    ;
    try {
      acumuladoRatingUsuario =
          doc.get(FirestoreConstants.acumuladoRatingUsuario);
    } catch (error) {}
    ;
    try {
      cantiadadTrabajosUsuario =
          doc.get(FirestoreConstants.cantiadadTrabajosUsuario);
    } catch (error) {}
    ;
    try {
      acumuladoRatingMaestro =
          doc.get(FirestoreConstants.acumuladoRatingMaestro);
    } catch (error) {}
    ;
    try {
      cantiadadTrabajosMaestro =
          doc.get(FirestoreConstants.cantiadadTrabajosMaestro);
    } catch (error) {}
    ;
    try {
      genero = doc.get(FirestoreConstants.genero);
    } catch (error) {}
    ;
    try {
      cumpleanos = doc.get(FirestoreConstants.cumpleanos);
    } catch (error) {}
    ;
    try {
      phone = doc.get(FirestoreConstants.phone);
    } catch (error) {}
    ;
    try {
      iniciado = doc.get(FirestoreConstants.iniciado);
    } catch (error) {}
    ;
    try {
      numeroTelefono = doc.get(FirestoreConstants.numeroTelefono);
    } catch (error) {}
    ;
    try {
      status = doc.get(FirestoreConstants.status);
    } catch (error) {}
    ;
    return UserChatInfo(
      id: doc.id,
      aboutMe: aboutMe,
      nickname: nickname,
      uid: uid,
      createdOn: createdOn,
      modifiedOn: modifiedOn,
      lastLogInOn: lastLogInOn,
      nombre: nombre,
      correo: correo,
      maestro: maestro,
      dirrecciones: dirrecciones,
      antecedentes: antecedentes,
      foto: foto,
      primerApellido: primerApellido,
      segundoApellido: segundoApellido,
      rut: rut,
      numeroDeSerie: numeroDeSerie,
      estadoDeChat: estadoDeChat,
      acumuladoRatingUsuario: acumuladoRatingUsuario,
      cantiadadTrabajosUsuario: cantiadadTrabajosUsuario,
      acumuladoRatingMaestro: acumuladoRatingMaestro,
      cantiadadTrabajosMaestro: cantiadadTrabajosMaestro,
      genero: genero,
      cumpleanos: cumpleanos,
      phone: phone,
      iniciado: iniciado,
      numeroTelefono: numeroTelefono,
      status: status,
    );
  }
}
