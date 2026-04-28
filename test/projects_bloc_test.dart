import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_hassan_portfolio/features/projects/data/datasources/projects_local_datasource_impl.dart';
import 'package:youssef_hassan_portfolio/features/projects/data/repositories/projects_repository_impl.dart';
import 'package:youssef_hassan_portfolio/features/projects/domain/usecases/load_projects_content_usecase.dart';
import 'package:youssef_hassan_portfolio/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:youssef_hassan_portfolio/features/projects/presentation/bloc/projects_state.dart';

void main() {
  late ProjectsBloc bloc;

  setUp(() {
    final repo = ProjectsRepositoryImpl(
      local: const ProjectsLocalDataSourceImpl(),
    );
    final useCase = LoadProjectsContentUseCase(repo);
    bloc = ProjectsBloc(loadProjectsContent: useCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('emits ProjectsReady with non-empty projects', () async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final state = bloc.state;
    expect(state, isA<ProjectsReady>());
    final ready = state as ProjectsReady;
    expect(ready.allProjects.isNotEmpty, isTrue);
  });
}
