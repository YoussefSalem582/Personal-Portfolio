import 'package:flutter/material.dart';
import '../../../../shared/widgets/responsive_layout.dart';

/// Skills overview section for the home page
class SkillsOverviewSection extends StatelessWidget {
  const SkillsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Skills & Technologies',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Here are the technologies I work with',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              ),
        ),
        const SizedBox(height: 32),
        ResponsiveLayout(
          mobile: _buildMobileLayout(context),
          tablet: _buildTabletLayout(context),
          desktop: _buildDesktopLayout(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _SkillCategory(
          title: 'Mobile Development',
          skills: ['Flutter', 'Dart', 'iOS', 'Android', 'React Native'],
          color: Colors.blue,
        ),
        const SizedBox(height: 16),
        _SkillCategory(
          title: 'Backend',
          skills: ['Node.js', 'Python', 'Firebase', 'MongoDB'],
          color: Colors.green,
        ),
        const SizedBox(height: 16),
        _SkillCategory(
          title: 'Machine Learning',
          skills: ['TensorFlow', 'PyTorch', 'OpenCV', 'Computer Vision'],
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _SkillCategory(
                title: 'Mobile Development',
                skills: ['Flutter', 'Dart', 'iOS', 'Android', 'React Native'],
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _SkillCategory(
                title: 'Backend',
                skills: ['Node.js', 'Python', 'Firebase', 'MongoDB'],
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _SkillCategory(
          title: 'Machine Learning',
          skills: ['TensorFlow', 'PyTorch', 'OpenCV', 'Computer Vision'],
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SkillCategory(
            title: 'Mobile Development',
            skills: ['Flutter', 'Dart', 'iOS', 'Android', 'React Native'],
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _SkillCategory(
            title: 'Backend',
            skills: ['Node.js', 'Python', 'Firebase', 'MongoDB'],
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _SkillCategory(
            title: 'Machine Learning',
            skills: ['TensorFlow', 'PyTorch', 'OpenCV', 'Computer Vision'],
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

/// Individual skill category widget
class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  final Color color;

  const _SkillCategory({
    required this.title,
    required this.skills,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map(
                    (skill) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: color.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        skill,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: color,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
