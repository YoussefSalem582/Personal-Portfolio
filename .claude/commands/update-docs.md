# Update Documentation

Update project documentation after a meaningful change.

## When to use

- User says "update docs", "update changelog", "document this"
- After completing a feature, fix, refactor, or content change that affects behavior or developer workflow

## Required

### 1 — `CHANGELOG.md`

- Add an entry under **`## [Unreleased]`** (create the section if missing) using `### Added`, `### Changed`, `### Fixed`, or `### Removed` as appropriate.
- Keep entries concise and factual.

### 2 — `tech_readme_files/` (when relevant)

- If the change affects architecture, contact form, deployment, localization, or navigation, update the matching doc listed in `tech_readme_files/DOCUMENTATION_MAP.md`.

**Note:** This portfolio repo does not maintain `tech_readme_files/DOCUMENTATION_UPDATE_SUMMARY.md` or `tech_readme_files/CURRENT_STATUS.md`.

## Steps

1. Confirm what changed from context or ask the user.
2. Edit `CHANGELOG.md` first.
3. Then patch any relevant `tech_readme_files/**/*.md` guide.
