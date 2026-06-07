# Agent Instructions

## Project

This is a Flutter mobile app.

## Tech Stack

- Flutter
- Dart
- Material 3
- ThemeData for styling

## Main Rules

- Use reusable widgets.
- Keep screens clean and not too large.
- Do not place all UI directly inside one screen file.
- Use mock data first unless API integration is requested.
- Do not add new packages unless necessary.
- Do not modify backend or unrelated files.

## Folder Rules

- Shared reusable widgets go in `lib/shared/widgets`.
- App theme files go in `lib/core/theme`.
- Feature-specific screens and widgets go in `lib/features/<feature>/presentation`.
- Feature mock data goes in `lib/features/<feature>/data`.
- Common models go in `lib/models`.

## UI Rules

- Follow `docs/DESIGN.md`.
- Follow `docs/UI_REQUIREMENTS.md`.
- Use responsive layouts.
- Avoid horizontal overflow.
- Support common mobile widths.
- Prefer `LayoutBuilder`, `Flexible`, `Expanded`, `Wrap`, and scroll views where appropriate.
- Avoid fixed widths unless necessary.

## Flutter Rules

- Prefer `StatelessWidget` when no local state is needed.
- Use `StatefulWidget` only when local UI state is required.
- Use `const` constructors where possible.
- Extract repeated UI into widgets.
- Keep business logic out of widget build methods.

## Before Finishing

Run:

- `flutter analyze`
- `flutter test`

Fix errors before reporting completion.

## Stitch HTML Reference Rule

The files in `docs/stitch-html/` are exported from Stitch and are used as visual/layout references only.

When implementing Flutter UI:

- Do not directly copy HTML/CSS.
- Translate the layout into Flutter widgets.
- Preserve the same screen hierarchy and component order.
- Preserve visible labels, section names, and navigation structure.
- Use `docs/DESIGN.md` for design tokens and style rules.
- Use `docs/SCREEN_SPEC.md` for exact screen layout.
