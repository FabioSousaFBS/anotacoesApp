
import 'package:anotacoesapp/core/dio_client/dio_client_implementacao.dart';
import 'package:anotacoesapp/core/shared_preferences/shared_preferences.dart';
import 'package:anotacoesapp/features/anotacoes/data/repository/anotacoes_repository_implementacao.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/get_lista_anotacoes_usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/remove_lista_anotacoes_usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/salvar_lista_anotacoes_usecase.dart';
import 'package:anotacoesapp/features/anotacoes/external/anotacoes_data_shared_preferences.dart';
import 'package:anotacoesapp/features/anotacoes/presentation/controller/anotacoes_controller.dart';
import 'package:anotacoesapp/features/login/data/repositories/autenticacao_repository_implementacao.dart';
import 'package:anotacoesapp/features/login/domain/usecases/get_usuarios_para_autenticacao_usecase.dart';
import 'package:anotacoesapp/features/login/external/api_mock_usuarios.dart';
import 'package:anotacoesapp/features/login/presentation/controller/login_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  
  getIt.registerLazySingleton<DioClientImplementacao>(() => DioClientImplementacao());
  getIt.registerLazySingleton<SharedPref>(() => SharedPref());
  
  getIt.registerLazySingleton<ApiUsuarioDatasource>(
    () => ApiUsuarioDatasource(GetIt.I.get<DioClientImplementacao>()));
  
  getIt.registerLazySingleton<AutenticacaoRepositoryImplementacao>(
    () => AutenticacaoRepositoryImplementacao(GetIt.I.get<ApiUsuarioDatasource>()));
  
  getIt.registerLazySingleton<GetUsuariosParaAutenticacaoUsecase>(
      () => GetUsuariosParaAutenticacaoUsecase(GetIt.I.get<AutenticacaoRepositoryImplementacao>()));

  getIt.registerLazySingleton<AnotacoesDatasourceImpl>(
    () => AnotacoesDatasourceImpl(GetIt.I.get<SharedPref>()));
  
  getIt.registerLazySingleton<AnotacoesRepositoryImplementacao>(
    () => AnotacoesRepositoryImplementacao(GetIt.I.get<AnotacoesDatasourceImpl>()));
  
  getIt.registerLazySingleton<GetListaAnotacoesUsecase>(
      () => GetListaAnotacoesUsecase(GetIt.I.get<AnotacoesRepositoryImplementacao>()));
    
  getIt.registerLazySingleton<RemoverListaAnotacoesUsecase>(
      () => RemoverListaAnotacoesUsecase(GetIt.I.get<AnotacoesRepositoryImplementacao>()));

  getIt.registerLazySingleton<SalvarListaAnotacoesUsecase>(
      () => SalvarListaAnotacoesUsecase(GetIt.I.get<AnotacoesRepositoryImplementacao>()));
  
  
  getIt.registerSingleton<LoginController>(LoginController(GetIt.I.get<GetUsuariosParaAutenticacaoUsecase>()));
  getIt.registerSingleton<AnotacoesController>(AnotacoesController(
      GetIt.I.get<GetListaAnotacoesUsecase>(),
      GetIt.I.get<SalvarListaAnotacoesUsecase>(),
      GetIt.I.get<RemoverListaAnotacoesUsecase>(),
  ));

}
