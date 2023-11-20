
import 'package:anotacoesapp/core/dio_client/dio_client_implementacao.dart';
import 'package:anotacoesapp/features/login/data/repositories/autenticacao_repository_implementacao.dart';
import 'package:anotacoesapp/features/login/domain/usecases/get_usuarios_para_autenticacao_usecase.dart';
import 'package:anotacoesapp/features/login/external/api_mock_usuarios.dart';
import 'package:anotacoesapp/features/login/presentation/controller/login_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  
  getIt.registerLazySingleton<DioClientImplementacao>(() => DioClientImplementacao());

  getIt.registerLazySingleton<ApiUsuarioDatasource>(
    () => ApiUsuarioDatasource(GetIt.I.get<DioClientImplementacao>()));
  
  getIt.registerLazySingleton<AutenticacaoRepositoryImplementacao>(
    () => AutenticacaoRepositoryImplementacao(GetIt.I.get<ApiUsuarioDatasource>()));
  
  getIt.registerLazySingleton<GetUsuariosParaAutenticacaoUsecase>(
      () => GetUsuariosParaAutenticacaoUsecase(GetIt.I.get<AutenticacaoRepositoryImplementacao>()));
    
  getIt.registerSingleton<LoginController>(LoginController(GetIt.I.get<GetUsuariosParaAutenticacaoUsecase>()));

}
