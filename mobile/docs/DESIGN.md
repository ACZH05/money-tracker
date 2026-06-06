# DESIGN.md — Azure Ledger

## 1. Overview & Creative North Star

The Creative North Star for this design system is **"The Translucent Sanctuary."**

For students and young professionals, financial tracking is often a source of anxiety. Azure Ledger should transform the "ledger" into a calm, editorial experience that feels less like a spreadsheet and more like a premium lifestyle journal.

The UI should move beyond generic fintech tiles by using:
- Intentional asymmetry
- Overlapping glass-like surfaces
- Soft gradients
- Expansive white space
- Dramatic contrast between large financial numbers and quiet supporting text
- Tonal layering instead of rigid section borders

The experience should feel:
- Calm
- Trustworthy
- Modern
- Premium
- Non-judgmental
- Easy to scan
- Fast to use

Avoid:
- Dense banking-style interfaces
- Harsh warning-heavy visuals
- Spreadsheet-like layouts
- Pure black text
- Sharp corners
- Heavy drop shadows
- Strong 1px borders for layout separation

---

## 2. Colors & Surface Architecture

This system uses a **Cool-to-Crisp** spectrum. Avoid pure white clinical interfaces by using a high-chroma light-blue base that feels refreshing and modern.

### Core Colors

| Token | Hex | Usage |
|---|---:|---|
| `surface` | `#F3FBFD` | Main app background |
| `surface_container` | `#E7EFF1` | Grouping related content |
| `surface_container_low` | `#EDF5F7` | Subtle secondary sections |
| `surface_container_lowest` | `#FFFFFF` | Highest-lift cards and main content surfaces |
| `surface_container_high` | `#E1EAEC` | Input fill and stronger surface areas |
| `surface_container_highest` | `#DCE4E6` | Focused input fill and high-emphasis surfaces |
| `primary` | `#006878` | Primary action, active nav, main accent |
| `primary_container` | `#90DDF0` | Soft cyan highlight and gradient end |
| `on_primary` | `#FFFFFF` | Text on primary buttons |
| `tertiary` | `#41636D` | Muted section titles and soft contrast |
| `on_surface` | `#151D1F` | Main readable text |
| `on_surface_variant` | `#3F484B` | Metadata and secondary text |
| `outline_variant` | `#BEC8CB` | Accessibility-only ghost border |
| `inverse_surface` | `#2A3233` | High-impact tooltips or temporary emphasis |

### The No-Line Rule

Avoid visible solid borders for layout separation. Boundaries should be established primarily through background color shifts and surface hierarchy.

Example:
- A `surface_container_low` section on top of `surface` is enough to show grouping.
- A `surface_container_lowest` card inside a `surface_container_low` section creates a soft lifted layer.

If a border is needed for accessibility, focus state, or input clarity, use `outline_variant` at 20% opacity. Do not use fully opaque 1px borders as a default layout tool.

### Surface Hierarchy & Nesting

Treat the UI as stacked sheets of frosted glass.

1. **Base Layer**
   - `surface` (`#F3FBFD`)
   - Used as the main screen background.

2. **Secondary Sections**
   - `surface_container` (`#E7EFF1`) or `surface_container_low` (`#EDF5F7`)
   - Used for grouping related content such as dashboard sections, budget areas, or history clusters.

3. **Primary Interaction Cards**
   - `surface_container_lowest` (`#FFFFFF`)
   - Used for account balances, spending summaries, recent transactions, and important CTAs.

### Glass & Gradient Rule

Use backdrop blur only on floating UI elements where it adds value:
- Bottom navigation bar
- Modal overlays
- Bottom sheets
- Floating action areas

Glass surfaces should use:
- 60% opacity of `surface_container_lowest`
- Backdrop blur between 16px and 24px
- Soft ambient shadow only when floating

### Signature CTA Texture

Primary action buttons should use a subtle linear gradient:

```txt
135deg: primary (#006878) → primary_container (#90DDF0)
```

This gives the main CTA a gem-like depth instead of a flat color.

---

## 3. Typography: Editorial Authority

Use **Manrope** for all typography.

The typography should feel like a premium financial magazine:
- Large, confident financial numbers
- Calm section titles
- Highly readable transaction details
- Muted metadata

### Typography Rules

#### Display Scale
Use display styles for hero numbers only:
- Total balance
- Monthly spending total
- Budget remaining
- Large transaction amount on Add Transaction screen

Display numbers should feel authoritative and slightly custom. Use tighter letter spacing where possible.

#### Headline Scale
Use headline styles for:
- Screen titles
- Section headers
- Budget category headings

`headline-sm` around `1.5rem` can use `tertiary` (`#41636D`) to create a muted premium feel.

#### Body & Label
Use body text for:
- Transaction names
- Category names
- Form labels
- Budget descriptions

Use label text sparingly for:
- Dates
- Payment method
- Metadata
- Helper text

Metadata should use `on_surface_variant` (`#3F484B`) for readability without clutter.

---

## 4. Elevation & Depth

Depth should be functional, not decorative. Use **tonal layering** instead of strong shadows.

### Layering Principle

Place a `surface_container_lowest` card on top of a `surface_container_low` or `surface_container` section to create natural lift.

Example:
- Screen background: `surface`
- Section background: `surface_container_low`
- Card background: `surface_container_lowest`

### Ambient Shadows

If a floating state is required, use an extra-diffused tinted shadow:

```css
box-shadow: 0 12px 32px -4px rgba(65, 99, 109, 0.08);
```

In Flutter, represent this with `BoxShadow`:
- Very low opacity
- Large blur radius
- Soft offset
- Tinted with the tertiary color

Avoid dark, harsh, or obvious drop shadows.

### Ghost Border Fallback

If borders are required for accessibility or input focus:
- Use `outline_variant` (`#BEC8CB`)
- Use 20% opacity
- Avoid fully opaque borders
- Do not use borders as the primary method of visual separation

---

## 5. Components

### Buttons

#### Primary Button
Use for:
- Login
- Register
- Save transaction
- Add budget
- Confirm important action

Rules:
- Rounded pill shape
- Height suitable for touch input
- Signature gradient from `primary` to `primary_container`
- Text color: `on_primary`
- Strong but calm visual emphasis

#### Secondary Button
Use for:
- Google login
- Alternative actions
- Less important confirmations

Rules:
- Background: `secondary_container`-style soft cyan surface
- Text: muted teal/dark cyan
- No visible border
- Rounded pill shape

#### Tertiary Button
Use for:
- Cancel
- Skip
- Low-emphasis navigation

Rules:
- No background
- Primary-colored text
- No border

---

### Cards & Lists

#### No-Divider Rule
Do not use 1px dividers between list items.

Separate transaction list items using:
- Vertical whitespace
- Card grouping
- Alternating tonal surfaces
- Spacing and typography hierarchy

#### Spending Cards
Use for:
- Balance summary
- Monthly income and expense
- Budget category progress
- Recent transaction previews

Rules:
- Background: `surface_container_lowest`
- Large rounded corners
- Soft tonal contrast
- No heavy border
- Internal padding should feel generous
- Must be thumb-friendly and mobile-first

---

### Input Fields

Inputs should feel calm, minimal, and comfortable.

Accepted styles:
- Soft-tinted box
- Minimal underline with filled background

Rules:
- Fill: `surface_container_high`
- Focus fill: `surface_container_highest`
- Focus accent: 2px `primary` accent at base or focus outline
- Rounded shape
- Large touch target
- Clear labels
- Helpful placeholder text
- Avoid harsh validation visuals

---

### Pulse Chip

Use Pulse Chips for income and expense labels.

Purpose:
- Communicate transaction type without overwhelming the calm aesthetic.

Structure:
- Soft-tinted background
- Small 4px high-saturation dot
- Text label such as `Income` or `Expense`

Rules:
- Avoid heavy solid green/red badges
- Use semantic color only in the small dot or subtle text accent
- Keep chip rounded and compact

---

## 6. Do’s and Don’ts

### Do

- Use large top-level page margins where possible to create an editorial feel.
- Use generous whitespace between major sections.
- Use overlapping elements carefully to create a layered glass effect.
- Use `inverse_surface` (`#2A3233`) for high-impact tooltips.
- Use muted teal/cyan tones for a calm financial experience.
- Use cards and surfaces instead of tables.
- Make key numbers very easy to scan.
- Keep transaction entry fast and low-friction.

### Don’t

- Do not use pure black (`#000000`) for text.
- Do not use sharp corners.
- Do not use visible 1px borders as the default section separator.
- Do not use standard heavy drop shadows.
- Do not make the app look like an old banking dashboard.
- Do not overcrowd charts.
- Do not overuse red or warning colors.
- Do not use dense tables for mobile transaction history.

---

## 7. Flutter Implementation Notes

This design system is intended for a **Flutter mobile application**.

### Theme Files

Define reusable design values instead of hardcoding styles in screens.

Recommended files:

```txt
lib/core/theme/app_colors.dart
lib/core/theme/app_text_styles.dart
lib/core/theme/app_theme.dart
lib/core/theme/app_spacing.dart
lib/core/theme/app_radius.dart
```

### Flutter Styling Rules

- Use `ThemeData` and `ColorScheme` where possible.
- Use `BoxDecoration` for surfaces, gradients, rounded containers, and soft shadows.
- Use `BorderRadius.circular(...)` for all rounded containers.
- Use `BackdropFilter` only where glass blur is required.
- Use reusable widgets for buttons, cards, input fields, chips, and navigation.
- Avoid hardcoding colors directly inside screen files.
- Avoid hardcoding repeated spacing and radius values.
- Prefer custom design tokens stored in theme/helper files.
- Do not place large UI blocks directly inside one screen file.

### Flutter Equivalents

| Design Concept | Flutter Equivalent |
|---|---|
| Backdrop blur | `BackdropFilter` |
| Gradient button | `BoxDecoration(gradient: LinearGradient(...))` |
| Rounded-full button | `BorderRadius.circular(999)` |
| Surface layering | Nested `Container`/`Card` with `BoxDecoration` |
| Ambient shadow | `BoxShadow` with low opacity and high blur |
| No-divider list | `ListView`/`Column` with spacing instead of `Divider` |
| Pulse chip | Custom widget using `Container`, `Row`, and small dot |

### Responsive Rules

- Design mobile-first.
- Use `SafeArea`.
- Use `SingleChildScrollView` for long screens.
- Use `LayoutBuilder`, `Flexible`, `Expanded`, and `Wrap` where needed.
- Avoid horizontal overflow.
- Support common mobile widths.
- Ensure bottom navigation does not block important content.
- Use comfortable tap targets for buttons, cards, nav items, and inputs.

### Package Guidance

Do not add new packages unless necessary.

If typography needs Manrope:
- Prefer using local font assets if already available.
- If the project already uses `google_fonts`, use `GoogleFonts.manrope`.
- Do not add `google_fonts` unless the team agrees.

### Accessibility

- Maintain strong text contrast.
- Do not rely on color alone to distinguish income vs expense.
- Use text labels with Pulse Chips.
- Ensure touch targets are comfortable.
- Keep forms readable and forgiving.
- Use clear error messages.
