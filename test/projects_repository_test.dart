import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_salem_portfolio/features/projects/data/datasources/projects_local_datasource_impl.dart';
import 'package:youssef_salem_portfolio/features/projects/data/repositories/projects_repository_impl.dart';
import 'package:youssef_salem_portfolio/features/projects/domain/entities/projects_content_entity.dart';

void main() {
  late ProjectsRepositoryImpl repo;

  setUp(() {
    repo = ProjectsRepositoryImpl(
      local: const ProjectsLocalDataSourceImpl(),
    );
  });

  test('loadProjectsContent returns Right with non-empty content', () async {
    final result = await repo.loadProjectsContent();
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('expected Right'),
      (content) {
        expect(content.projects.isNotEmpty, isTrue);
      },
    );
  });

  test('resolveProjectSegment finds by id and returns null when missing', () async {
    final content = await _content(repo);
    final project = content.projects.first;
    expect(repo.resolveProjectSegment(project.id), equals(project));
    expect(repo.resolveProjectSegment('__no_such_id__'), isNull);
  });

  test('slug matches title hyphenated lowercase', () async {
    final content = await _content(repo);
    final first = content.projects.first;
    final slug = first.title.toLowerCase().replaceAll(' ', '-');
    expect(repo.resolveProjectSegment(slug), equals(first));
  });

  test('resolve prefers id then slug', () async {
    final content = await _content(repo);
    final first = content.projects.first;
    expect(repo.resolveProjectSegment(first.id), equals(first));
    final slug = first.title.toLowerCase().replaceAll(' ', '-');
    expect(repo.resolveProjectSegment(slug), equals(first));
    expect(repo.resolveProjectSegment('bad-segment-slug-xx'), isNull);
  });
}

Future<ProjectsContentEntity> _content(ProjectsRepositoryImpl repo) async {
  final r = await repo.loadProjectsContent();
  return r.fold<ProjectsContentEntity>(
    (f) => throw Exception(f.message),
    (s) => s,
  );
}
