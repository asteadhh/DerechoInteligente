import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/firebase_auth_constants.dart';
import '../../constants/firestore_constants.dart';
import '../../models/user_chat.dart';
import '../../widgets/userInformation/User_Information.dart';

class UserDataController extends GetxController {
  var userInfo = [].obs;

  @override
  void onInit() {
    _fetchUserInfo(auth.currentUser!.uid);
    // userInfo = datosUsuarioLogiado(auth.currentUser!.uid);
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // userInfo = datosUsuarioLogiado(auth.currentUser!.uid);
    // TODO: implement onReady
    super.onReady();
  }

  Future<UserChatInfo> _fetchUserInfo(String id) async {
    print('_fetchUserInfo');
    UserChatInfo fetchedUser;
    var snapshot =
        await FirebaseFirestore.instance.collection('user').doc(id).get();
    return UserChatInfo(
      aboutMe: snapshot[FirestoreConstants.aboutMe],
      acumuladoRatingMaestro:
          snapshot[FirestoreConstants.acumuladoRatingMaestro],
      acumuladoRatingUsuario:
          snapshot[FirestoreConstants.acumuladoRatingUsuario],
      antecedentes: snapshot[FirestoreConstants.antecedentes],
      uid: snapshot[FirestoreConstants.uid],
      createdOn: snapshot[FirestoreConstants.createdOn],
      modifiedOn: snapshot[FirestoreConstants.modifiedOn],
      lastLogInOn: snapshot[FirestoreConstants.lastLogInOn],
      nombre: snapshot[FirestoreConstants.nombre],
      correo: snapshot[FirestoreConstants.correo],
      maestro: snapshot[FirestoreConstants.acumuladoRatingUsuario],
      dirrecciones: snapshot[FirestoreConstants.maestro],
      foto: snapshot[FirestoreConstants.foto],
      primerApellido: snapshot[FirestoreConstants.primerApellido],
      segundoApellido: snapshot[FirestoreConstants.segundoApellido],
      rut: snapshot[FirestoreConstants.rut],
      numeroDeSerie: snapshot[FirestoreConstants.numeroDeSerie],
      estadoDeChat: snapshot[FirestoreConstants.estadoDeChat],
      cantiadadTrabajosUsuario:
          snapshot[FirestoreConstants.cantiadadTrabajosUsuario],
      cantiadadTrabajosMaestro:
          snapshot[FirestoreConstants.cantiadadTrabajosMaestro],
      genero: snapshot[FirestoreConstants.genero],
      cumpleanos: snapshot[FirestoreConstants.cumpleanos],
      phone: snapshot[FirestoreConstants.phone],
      iniciado: snapshot[FirestoreConstants.iniciado],
      status: snapshot[FirestoreConstants.status],
      numeroTelefono: snapshot[FirestoreConstants.numeroTelefono],
      id: snapshot[FirestoreConstants.id],
      nickname: snapshot[FirestoreConstants.nickname],
    );
  }

  datosUsuarioLogiado(String uid) async {
    final user = await _fetchUserInfo(uid);
    print('datosUsuarioLogiado');
    return user;
  }
}
