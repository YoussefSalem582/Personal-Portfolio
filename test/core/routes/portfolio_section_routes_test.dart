import 'package:flutter_test/flutter_test.dart';
import 'package:youssef_hassan_portfolio/core/routes/app_routes.dart';
import 'package:youssef_hassan_portfolio/core/routes/portfolio_section_routes.dart';

void main() {
  group('PortfolioSectionRoutes', () {
    test('pathForIndex maps hero and sections', () {
      expect(PortfolioSectionRoutes.pathForIndex(0), AppRoutes.home);
      expect(PortfolioSectionRoutes.pathForIndex(1), AppRoutes.about);
      expect(PortfolioSectionRoutes.pathForIndex(2), AppRoutes.skills);
      expect(PortfolioSectionRoutes.pathForIndex(3), AppRoutes.experience);
      expect(PortfolioSectionRoutes.pathForIndex(4), AppRoutes.projects);
      expect(PortfolioSectionRoutes.pathForIndex(5), AppRoutes.certificates);
      expect(PortfolioSectionRoutes.pathForIndex(6), AppRoutes.contact);
    });

    test('pathForIndex clamps unknown indices to home', () {
      expect(PortfolioSectionRoutes.pathForIndex(-1), AppRoutes.home);
      expect(PortfolioSectionRoutes.pathForIndex(99), AppRoutes.home);
    });

    test('indexForSegment parses canonical segment', () {
      expect(PortfolioSectionRoutes.indexForSegment('about'), 1);
      expect(PortfolioSectionRoutes.indexForSegment('contact'), 6);
      expect(PortfolioSectionRoutes.indexForSegment('unknown'), isNull);
    });

    test('normalizePath trims trailing slash', () {
      expect(PortfolioSectionRoutes.normalizePath('/about/'), '/about');
      expect(PortfolioSectionRoutes.normalizePath('/about'), '/about');
    });

    test('pathMatchesIndex', () {
      expect(PortfolioSectionRoutes.pathMatchesIndex('/', 0), isTrue);
      expect(PortfolioSectionRoutes.pathMatchesIndex('/about', 1), isTrue);
      expect(PortfolioSectionRoutes.pathMatchesIndex('/about/', 1), isTrue);
      expect(PortfolioSectionRoutes.pathMatchesIndex('/about', 2), isFalse);
    });
  });
}
