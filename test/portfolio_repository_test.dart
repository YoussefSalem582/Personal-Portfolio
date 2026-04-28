import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/datasources/portfolio_local_datasource_impl.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:youssef_hassan_portfolio/features/portfolio/domain/entities/portfolio_snapshot_entity.dart';

void main() {
  late PortfolioRepositoryImpl repo;

  setUp(() {
    repo = PortfolioRepositoryImpl(
      local: const PortfolioLocalDataSourceImpl(),
    );
  });

  test('loadSnapshot returns Right with non-empty snapshot', () async {
    final result = await repo.loadSnapshot();
    expect(result.isRight(), isTrue);
    result.fold(
      (_) => fail('expected Right'),
      (snapshot) {
        expect(snapshot.projects.isNotEmpty, isTrue);
        expect(snapshot.certificates.isNotEmpty, isTrue);
      },
    );
  });

  test('resolveProjectSegment finds by id and returns null when missing', () async {
    final snapshot = await _snapshot(repo);
    final project = snapshot.projects.first;
    expect(repo.resolveProjectSegment(project.id), equals(project));
    expect(repo.resolveProjectSegment('__no_such_id__'), isNull);
  });

  test('slug matches title hyphenated lowercase', () async {
    final snapshot = await _snapshot(repo);
    final first = snapshot.projects.first;
    final slug = first.title.toLowerCase().replaceAll(' ', '-');
    expect(repo.resolveProjectSegment(slug), equals(first));
  });

  test('resolve prefers id then slug', () async {
    final snapshot = await _snapshot(repo);
    final first = snapshot.projects.first;
    expect(repo.resolveProjectSegment(first.id), equals(first));
    final slug = first.title.toLowerCase().replaceAll(' ', '-');
    expect(repo.resolveProjectSegment(slug), equals(first));
    expect(repo.resolveProjectSegment('bad-segment-slug-xx'), isNull);
  });

  test('snapshot has social links', () async {
    final snapshot = await _snapshot(repo);
    expect(snapshot.socialLinks.isNotEmpty, isTrue);
  });
}

Future<PortfolioSnapshotEntity> _snapshot(PortfolioRepositoryImpl repo) async {
  final snap = await repo.loadSnapshot();
  return snap.fold<PortfolioSnapshotEntity>(
    (f) => throw Exception(f.message),
    (s) => s,
  );
}
