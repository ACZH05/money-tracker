# SCREEN_SPEC.md

This document is derived from the exported Stitch HTML files in `docs/stitch_html/`. It defines screen structure and content order only, not Flutter widget implementation. Visual styling should still follow `docs/DESIGN.md`, and this screen spec should be followed even when the HTML uses web-only constructs.

## Global Patterns

- Auth screens do not use bottom navigation.
- Auth and app screens are mobile-first, vertically stacked, and centered within the viewport.
- Main content scrolls vertically and reserves bottom space when fixed navigation or a fixed CTA is present.
- Cards and list items are separated by whitespace and tonal surface changes rather than dividers.
- Authenticated screens use a fixed translucent top bar and a fixed rounded bottom navigation bar.
- Repeated bottom navigation icons across authenticated screens are `home`, `history`, `add_circle`, `pie_chart`, and `person`.
- The active bottom navigation item is a filled gradient circular button; inactive items are plain icon buttons.
- The exported HTML uses the product name `The Fluid Ledger`; preserve that exact text in future UI translation of these references.
- Dashboard, Transactions History, and Budget repeat the same top-bar pattern: avatar on the left, app name in the left cluster, notification button on the right.
- Large page padding is consistent throughout: top padding clears the fixed header, bottom padding clears the fixed bottom navigation, and major sections are separated by generous vertical gaps.

## Login Screen

**Source HTML:** `docs/stitch_html/login.html`

### High-Level Layout

- Full-screen centered authentication layout.
- Mobile layout is single-column.
- Large-screen layout becomes a two-column split:
  - left column for branding and illustration
  - right column for the login form
- Fixed bottom gradient strip spans the width of the screen.

### Top-to-Bottom Component Hierarchy

#### Desktop Left Column

1. Brand row with gradient wallet icon and app name `The Fluid Ledger`
2. Editorial headline block
3. Supporting paragraph
4. Abstract illustration area
5. Floating glass-like accent elements inside the illustration area

#### Right Column / Mobile Main Content

1. Mobile-only centered brand mark and app name `The Fluid Ledger`
2. Heading `Welcome Back`
3. Supporting text `Please enter your details to continue`
4. Social login button `Continue with Google`
5. Divider row with `or email`
6. Email field section
7. Password field section with forgot-password link
8. Remember-me row
9. Primary CTA button `Login`
10. Redirect row `Don't have an account? Register`

### Visible Text Inventory

- `The Fluid Ledger`
- `Your finances, perfectly balanced.`
- `Experience the translucent sanctuary of modern wealth management. Track, save, and grow with editorial elegance.`
- `Welcome Back`
- `Please enter your details to continue`
- `Continue with Google`
- `or email`
- `Email Address`
- `hello@example.com`
- `Password`
- `Forgot password?`
- `Stay signed in for 30 days`
- `Login`
- `Don't have an account?`
- `Register`

### Navigation Behavior

- No bottom navigation.
- `Forgot password?` appears as a secondary inline action in the password row.
- `Register` appears as the auth redirect action.

### Spacing and Scrolling Notes

- The screen is vertically centered within the viewport.
- Desktop version uses a wide gap between branding and form columns.
- The form uses evenly spaced stacked groups.
- The illustration column is hidden on smaller screens.
- A fixed footer gradient strip stays attached to the bottom edge.

### Repeated and Reusable Patterns

- Auth branding mark with gradient icon and app name
- Social button above an `or email` divider
- Stacked labeled fields with leading icons
- Password field with trailing visibility button
- Large primary auth CTA
- Auth redirect row below the form

## Register Screen

**Source HTML:** `docs/stitch_html/register.html`

### High-Level Layout

- Centered single-column authentication layout.
- Content is vertically stacked in one narrow centered column.
- Fixed bottom gradient strip spans the width of the screen.

### Top-to-Bottom Component Hierarchy

1. Centered branding block with app icon and app name `The Fluid Ledger`
2. Heading block
3. Social registration button `Continue with Google`
4. Divider row with `or email`
5. Registration form
6. Primary CTA button `Register`
7. Redirect row `Already have an account? Login`

### Form Field Order

1. `Full Name`
2. `Email Address`
3. `Password`
4. `Confirm Password`

### Visible Text Inventory

- `The Fluid Ledger`
- `Create Account`
- `Please enter your details to join us`
- `Continue with Google`
- `or email`
- `Full Name`
- `John Doe`
- `Email Address`
- `hello@example.com`
- `Password`
- `Confirm Password`
- `Register`
- `Already have an account?`
- `Login`

### Navigation Behavior

- No bottom navigation.
- `Login` is the only redirect action on the screen.

### Spacing and Scrolling Notes

- Content is centered with large vertical spacing between branding, heading, social login, divider, form, and redirect.
- Form fields are stacked with consistent gaps.
- Footer gradient strip remains fixed to the bottom edge.

### Repeated and Reusable Patterns

- Same auth branding treatment as Login
- Same social button plus `or email` divider pattern
- Same soft stacked input pattern with leading icons
- Same primary gradient CTA pattern
- Same centered auth rhythm and spacing behavior

## Home Dashboard

**Source HTML:** `docs/stitch_html/home-dashboard.html`

### High-Level Layout

- Authenticated app screen with fixed translucent top bar and fixed bottom navigation.
- Main content scrolls vertically between the two fixed bars.
- Content is constrained to a centered narrow column on large screens.

### Top-to-Bottom Component Hierarchy

1. Fixed top app bar
2. Total balance hero card
3. Two-card income versus expense summary grid
4. `Monthly Overview` chart section
5. `Recent Transactions` section
6. `Monthly Budget` inverse-surface progress card
7. Fixed bottom navigation

### Fixed Top App Bar

1. Avatar
2. App name `The Fluid Ledger`
3. Notification button

### Section Details

#### Total Balance Hero Card

- Section label `Total Balance`
- Currency marker `$`
- Balance value `12,450.80`
- Trend chip `+2.4%`
- Supporting text `vs last month`

#### Income vs Expense Summary Grid

- Card 1:
  - `Income`
  - `$8,200`
  - `Received this month`
- Card 2:
  - `Expense`
  - `$3,420`
  - `Spent this month`

#### Monthly Overview Section

- Section title `Monthly Overview`
- Month label `June 2024`
- Decorative bar-style chart placeholder

#### Recent Transactions Section

- Section title `Recent Transactions`
- Action `View All`
- Transaction rows in order:
  1. `Grocery Store` / `Today, 10:45 AM` / `-$124.50`
  2. `Salary Deposit` / `Yesterday` / `+$4,200.00`
  3. `Streaming Service` / `Jun 12, 2024` / `-$15.99`

#### Monthly Budget Card

- `Monthly Budget`
- `75% of your limit used`
- Circular progress display `75%`
- Progress bar
- `$3,000.00 spent`
- `$4,000.00 limit`

### Visible Text Inventory

- `The Fluid Ledger`
- `Total Balance`
- `$12,450.80`
- `+2.4%`
- `vs last month`
- `Income`
- `$8,200`
- `Received this month`
- `Expense`
- `$3,420`
- `Spent this month`
- `Monthly Overview`
- `June 2024`
- `Recent Transactions`
- `View All`
- `Grocery Store`
- `Today, 10:45 AM`
- `-$124.50`
- `Salary Deposit`
- `Yesterday`
- `+$4,200.00`
- `Streaming Service`
- `Jun 12, 2024`
- `-$15.99`
- `Monthly Budget`
- `75% of your limit used`
- `75%`
- `$3,000.00 spent`
- `$4,000.00 limit`

### Navigation Behavior

- Bottom navigation is present.
- `home` is the active bottom navigation item.
- Inactive bottom navigation items are `history`, `add_circle`, `pie_chart`, and `person`.

### Spacing and Scrolling Notes

- Content begins below the fixed top bar.
- Extra bottom padding keeps the last section clear of the fixed bottom navigation.
- Major sections are spaced with generous vertical gaps.
- Recent transaction cards are separated by vertical spacing instead of dividers.

### Repeated and Reusable Patterns

- Shared authenticated top bar
- Shared fixed glass-style bottom navigation
- Rounded summary cards
- Section heading row with optional right-side action
- Spaced transaction-card stack without dividers

## Add Transaction Screen

**Source HTML:** `docs/stitch_html/add-transaction.html`

### High-Level Layout

- Authenticated app screen with fixed top bar, fixed save CTA area, and fixed bottom navigation.
- Main content scrolls vertically between the top bar and lower fixed regions.
- The amount card is the main visual focus of the screen.

### Top-to-Bottom Component Hierarchy

1. Fixed top bar with back button and title
2. Segmented transaction type selector
3. Centered amount card
4. `Select Category` section
5. Category grid
6. Date row
7. Notes card
8. Fixed save CTA area
9. Fixed bottom navigation

### Visible Text Inventory

- `Add Transaction`
- `Expense`
- `Income`
- `Transaction Amount`
- `0.00`
- `Select Category`
- `Food`
- `Transport`
- `Rent`
- `Shopping`
- `Beauty`
- `Health`
- `Bills`
- `More`
- `Date`
- `Oct 24, 2023`
- `Notes`
- `Add a note...`
- `Save Transaction`

### Navigation Behavior

- Back arrow is the top-bar navigation control.
- Bottom navigation is present.
- `add_circle` is the active bottom navigation item.
- Inactive bottom navigation items are `home`, `history`, `pie_chart`, and `person`.

### Spacing and Scrolling Notes

- Content starts below the fixed top bar.
- Main content includes extra bottom padding so the save CTA and bottom nav do not cover the last fields.
- The category area uses a compact but even 4-column grid.
- The save CTA is fixed above the bottom navigation bar.
- The amount card sits near the top of the content and is visually prioritized.

### Repeated and Reusable Patterns

- Shared fixed bottom navigation
- Rounded card surfaces
- Stacked detail rows using icon-leading layouts
- Compact icon-plus-label selection tiles
- Fixed bottom action bar above bottom navigation

## Transactions History Screen

**Source HTML:** `docs/stitch_html/transaction-history.html`

### High-Level Layout

- Authenticated app screen with fixed translucent top bar and fixed bottom navigation.
- Main content starts with search and filter tools, then moves into grouped chronological transaction lists.

### Top-to-Bottom Component Hierarchy

1. Fixed top app bar
2. Search input and filter button row
3. `Today` transaction group
4. `Yesterday` transaction group
5. `May 15` transaction group
6. Fixed bottom navigation

### Fixed Top App Bar

1. Avatar
2. App name `The Fluid Ledger`
3. Notification button

### Transaction Group Structure

- Uppercase group heading
- Vertical stack of rounded transaction cards beneath the heading
- Each transaction card has:
  - left icon circle
  - title and date/time block
  - right-aligned amount
  - small dot plus category/type label beneath amount

### Transaction Items in Order

#### Today

1. `Artisan Espresso` / `May 24, 09:15 AM` / `-$6.50` / `Food & Drink`
2. `Freelance Project` / `May 24, 11:45 AM` / `+$1,200.00` / `Income`

#### Yesterday

1. `Premium Apparel` / `May 23, 04:30 PM` / `-$84.20` / `Shopping`
2. `Cloud Storage` / `May 23, 08:00 AM` / `-$9.99` / `Tech`

#### May 15

1. `Monthly Rent` / `May 15, 10:00 AM` / `-$1,850.00` / `Housing`

### Visible Text Inventory

- `The Fluid Ledger`
- `Search transactions...`
- `Today`
- `Artisan Espresso`
- `May 24, 09:15 AM`
- `-$6.50`
- `Food & Drink`
- `Freelance Project`
- `May 24, 11:45 AM`
- `+$1,200.00`
- `Income`
- `Yesterday`
- `Premium Apparel`
- `May 23, 04:30 PM`
- `-$84.20`
- `Shopping`
- `Cloud Storage`
- `May 23, 08:00 AM`
- `-$9.99`
- `Tech`
- `May 15`
- `Monthly Rent`
- `May 15, 10:00 AM`
- `-$1,850.00`
- `Housing`

### Navigation Behavior

- Bottom navigation is present.
- `history` is the active bottom navigation item.
- Inactive bottom navigation items are `home`, `add_circle`, `pie_chart`, and `person`.

### Spacing and Scrolling Notes

- Content starts below the fixed header.
- Extra bottom padding keeps the final group clear of the fixed bottom navigation.
- Search and filter controls are presented as a single horizontal control row.
- Date groups are separated by large vertical gaps.
- Transaction cards within a group are separated by vertical spacing rather than dividers.

### Repeated and Reusable Patterns

- Shared authenticated top bar
- Shared fixed glass-style bottom navigation
- Grouped list section pattern with uppercase heading and stacked cards
- Transaction-card structure reused across multiple date groups

## Budget Screen

**Source HTML:** `docs/stitch_html/budget.html`

### High-Level Layout

- Authenticated app screen with fixed translucent top bar and fixed bottom navigation.
- Main content contains an editorial header, an overview card, a category breakdown area, and an insight panel.

### Top-to-Bottom Component Hierarchy

1. Fixed top app bar
2. Editorial page header
3. Monthly overview card
4. Category breakdown header row
5. Category budget card grid
6. `Budget Insight` panel
7. Fixed bottom navigation

### Fixed Top App Bar

1. Avatar
2. App name `The Fluid Ledger`
3. Notification button

### Editorial Page Header

- `My Budgets`
- `Monthly oversight for October 2023`

### Monthly Overview Card

- Circular progress display
- `Spent`
- `61%`
- `Total Monthly Budget`
- `$2,450 / $4,000`
- `$1,550 Remaining`
- `22 Days Left`

### Category Breakdown Header

- `Category Breakdown`
- `Adjust Limits`

### Category Budget Cards in Order

1. `Food & Dining`
   - `Daily essentials`
   - `75%`
   - `$450 spent`
   - `of $600`
2. `Transport`
   - `Commute & Fuel`
   - `40%`
   - `$120 spent`
   - `of $300`
3. `Shopping`
   - `Over budget`
   - `115%`
   - `$575 spent`
   - `of $500`
4. `Rent & Bills`
   - `Monthly fixed`
   - `92%`
   - `$1,100 spent`
   - `of $1,200`

### Budget Insight Panel

- `Budget Insight`
- `Your shopping expense is 15% higher than last month. Consider moving $75 from your remaining Transport budget to cover the difference.`

### Visible Text Inventory

- `The Fluid Ledger`
- `My Budgets`
- `Monthly oversight for October 2023`
- `Spent`
- `61%`
- `Total Monthly Budget`
- `$2,450`
- `/ $4,000`
- `$1,550 Remaining`
- `22 Days Left`
- `Category Breakdown`
- `Adjust Limits`
- `Food & Dining`
- `Daily essentials`
- `75%`
- `$450 spent`
- `of $600`
- `Transport`
- `Commute & Fuel`
- `40%`
- `$120 spent`
- `of $300`
- `Shopping`
- `Over budget`
- `115%`
- `$575 spent`
- `of $500`
- `Rent & Bills`
- `Monthly fixed`
- `92%`
- `$1,100 spent`
- `of $1,200`
- `Budget Insight`
- `Your shopping expense is 15% higher than last month. Consider moving $75 from your remaining Transport budget to cover the difference.`

### Navigation Behavior

- Bottom navigation is present.
- `pie_chart` is the active bottom navigation item.
- Inactive bottom navigation items are `home`, `history`, `add_circle`, and `person`.

### Spacing and Scrolling Notes

- Content starts below the fixed top bar and leaves room at the bottom for fixed navigation.
- The overview card is a large feature block separated from the page header by generous vertical spacing.
- The category cards stack in one column on mobile and expand to a two-column grid on wider layouts.
- The insight panel sits below the category section as a separate emphasized closing block.

### Repeated and Reusable Patterns

- Shared authenticated top bar
- Shared fixed glass-style bottom navigation
- Rounded feature card followed by smaller supporting cards
- Icon-led category cards with percent pill, progress bar, and spent-versus-limit row
- Shopping is the only intentionally emphasized warning-state card in the exported screen

## Validation Checklist

- All six exported HTML screens in `docs/stitch_html/` are covered.
- Each screen is described in exact top-to-bottom section order.
- User-visible headings, field labels, CTA labels, and grouped section titles from the HTML are captured.
- Active bottom navigation state is recorded for each authenticated screen.
- Fixed header, fixed bottom navigation, and fixed save CTA spacing behavior are described where relevant.
- Repeated patterns are extracted once globally and reinforced consistently across screen sections.
- No Flutter widget decisions, code structure, or redesign guidance are introduced here.

## Assumptions

- This spec covers all six exported screens in `docs/stitch_html/`, not only the HTML files currently open in the editor.
- The exact exported reference text `The Fluid Ledger` is preserved even though other project docs refer to Azure Ledger.
- The repository path on disk is `docs/stitch_html/`; references to `docs/stitch-html` in other docs should be interpreted as the same Stitch export source.
- No interactive behavior beyond what is visible in the exported HTML is defined here.
