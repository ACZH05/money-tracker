# UI_REQUIREMENTS.md — Azure Ledger

## 1. Purpose

This document defines the UI requirements for **Azure Ledger**, a Flutter mobile money tracker app for students and young professionals.

The UI must follow `docs/DESIGN.md`, especially the **Translucent Sanctuary** direction:
- Calm and non-judgmental financial tracking
- Light cyan/teal visual identity
- Glassmorphism and tonal layering
- Rounded, mobile-first cards and controls
- Minimal borders
- Editorial spacing and readable financial numbers

This document focuses on **what screens and widgets must be built**.  
`DESIGN.md` controls **how the app should look and feel**.  
`AGENTS.md` controls **how Codex should implement the app**.

---

## 2. Target Platform

### Primary Platform
- Flutter mobile app

### Target Devices
- Android phones
- iPhones
- Common mobile widths

### Layout Priority
- Mobile-first
- Vertical scrolling
- No horizontal overflow
- Comfortable one-handed use where possible

---

## 3. App Navigation Requirements

The app should use a minimalist bottom navigation system after authentication.

### Main Navigation Items

1. Home
2. Transactions
3. Add Transaction
4. Budget
5. Profile or Settings placeholder if needed

### Navigation Rules

- Use icon-first or icon-only bottom navigation.
- Active item should use the primary cyan/teal accent from `DESIGN.md`.
- The Add Transaction action may be visually emphasized.
- Use a floating/glass-style bottom navigation if feasible.
- Bottom navigation should not block screen content.
- Navigation should remain consistent across Home, Transactions, Add Transaction, and Budget screens.
- Login and Register screens should not show the bottom navigation.

---

## 4. Required Screens

The current required screens are:

1. Login Screen
2. Register Screen
3. Home Dashboard
4. Add Transaction Screen
5. Transactions History Screen
6. Budget Screen

Future screens such as Analytics, Profile, Settings, Savings Goals, and Dark Mode are not required in the first implementation unless explicitly requested.

---

## 5. Screen Requirements

## 5.1 Login Screen

### Purpose

Allow existing users to access Azure Ledger through email/password or social login.

### Required UI Sections

1. Brand/Header Area
   - App name: Azure Ledger
   - Short welcoming message
   - Calm financial-tracking tone

2. Login Form
   - Email field
   - Password field
   - Login button

3. Social Login
   - Google login button or placeholder button

4. Register Redirect
   - Text link to Register screen

### Design Requirements

- Centered authentication layout.
- Use a soft card or glass-like container.
- Use generous spacing.
- Avoid a dense banking-app feel.
- Primary login button should use the signature gradient from `DESIGN.md`.
- Inputs should use soft filled surfaces.
- Do not use harsh borders.

### Acceptance Criteria

- User can visually identify the app name.
- Email and password fields are visible.
- Login button is clearly visible.
- Google login option or placeholder exists.
- Register link exists.
- Layout does not overflow on small mobile screens.

---

## 5.2 Register Screen

### Purpose

Allow new users to create an Azure Ledger account.

### Required UI Sections

1. Brand/Header Area
   - App name
   - Short onboarding message

2. Register Form
   - Name field
   - Email field
   - Password field
   - Confirm password field if needed

3. Social Register
   - Google register/login button or placeholder

4. Login Redirect
   - Text link to Login screen

### Design Requirements

- Should visually match Login Screen.
- Use the same card, input, and button styling.
- Keep form friendly and not intimidating.
- Avoid excessive fields in the first version.

### Acceptance Criteria

- Name, email, and password inputs are visible.
- Register button is clearly visible.
- Google option or placeholder exists.
- Login redirect exists.
- Screen is scrollable if content exceeds height.

---

## 5.3 Home Dashboard

### Purpose

Provide a calm high-level overview of the user's financial status.

### Required UI Sections

1. Greeting/Header
   - Friendly greeting
   - Optional current month label
   - Optional profile/avatar placeholder

2. Total Balance Hero Card
   - Total balance value
   - Short supporting label
   - Optional small trend indicator

3. Monthly Summary
   - Monthly income
   - Monthly expenses
   - Remaining balance or savings amount

4. Spending Visualization
   - Simple spending chart, progress ring, bar, or placeholder visualization
   - Should not be visually crowded

5. Recent Transactions
   - List of the latest transactions
   - Transaction name
   - Category
   - Date
   - Amount
   - Income/expense indicator

6. Quick Action
   - Add Transaction shortcut
   - Optional Budget shortcut

### Design Requirements

- Total balance should be the visual hero.
- Use large Manrope-style display typography for the balance amount.
- Use layered cards instead of tables.
- Use no dividers between recent transaction items.
- Separate transaction items using spacing or tonal shifts.
- Use Pulse Chips for income/expense indicators if applicable.
- The screen must feel calm and breathable.

### Acceptance Criteria

- Total balance is immediately visible.
- Monthly income and expenses are shown.
- Spending visualization exists, even if using mock data.
- Recent transactions list exists.
- Add Transaction action is accessible.
- Bottom navigation is visible.
- Layout works on small mobile screens.

---

## 5.4 Add Transaction Screen

### Purpose

Allow users to quickly record income or expenses.

### Required UI Sections

1. Transaction Type Selector
   - Income
   - Expense

2. Amount Entry
   - Amount should be the main focus of the screen.
   - Large number input or amount display.

3. Transaction Details Form
   - Description/title
   - Category
   - Date
   - Payment method or account, if applicable
   - Optional notes field

4. Save Action
   - Primary Save/Add Transaction button
   - Optional Cancel button

### Design Requirements

- Prioritize speed of entry.
- Amount input should feel prominent.
- Use soft filled input fields.
- Use Pulse Chip or segmented control style for Income/Expense.
- Avoid heavy form borders.
- Primary save button should use the signature gradient.
- Form should be scrollable if necessary.

### Acceptance Criteria

- User can identify whether they are adding income or expense.
- Amount input is clear and prominent.
- Required detail fields are visible.
- Save button is clearly visible.
- Cancel or back navigation is available.
- No horizontal overflow.

---

## 5.5 Transactions History Screen

### Purpose

Show a chronological list of income and expense records.

### Required UI Sections

1. Header
   - Screen title: Transactions or History
   - Optional month/filter control

2. Summary Strip
   - Optional total income
   - Optional total expenses
   - Optional net total for selected period

3. Filter/Search Area
   - Search by transaction name
   - Filter by category or type
   - Date/month filter, if feasible

4. Transaction List
   - Transaction title
   - Category
   - Date
   - Amount
   - Income/expense indicator
   - Optional payment method

5. Empty State
   - Friendly message when no transactions exist
   - Add Transaction shortcut

### Design Requirements

- Do not use table layout.
- Do not use hard dividers between items.
- Use card/list spacing or tonal background shifts.
- Income and expense should be easy to distinguish without relying only on color.
- Use calm semantic colors.
- Keep transaction rows readable and thumb-friendly.

### Acceptance Criteria

- Transactions are listed chronologically.
- Each transaction shows title, category/date, and amount.
- Income/expense distinction is visible.
- Search/filter UI exists or placeholder exists.
- Empty state exists.
- Bottom navigation is visible.

---

## 5.6 Budget Screen

### Purpose

Help users monitor monthly spending limits in a calm and non-judgmental way.

### Required UI Sections

1. Header
   - Screen title: Budget
   - Current month label

2. Monthly Budget Overview
   - Total monthly budget
   - Total spent
   - Remaining amount
   - Progress ring, progress bar, or placeholder visualization

3. Category Budget Cards
   - Category name
   - Spent amount
   - Limit amount
   - Progress indicator
   - Status text such as On Track, Near Limit, or Over Budget

4. Insight Panel
   - Short automated insight or placeholder
   - Tone must be supportive, not judgmental

5. Add/Edit Budget Action
   - Button or card to add/edit budget

### Design Requirements

- Use progress rings or soft progress bars.
- Avoid aggressive red warning states.
- Use calm text for insights.
- Use spending cards with large rounded corners.
- Use tonal layering instead of borders.

### Acceptance Criteria

- Monthly budget overview is visible.
- Spent vs limit is shown.
- Category budget cards exist.
- At least one supportive insight appears.
- Add/edit budget action exists.
- Bottom navigation is visible.

---

## 6. Shared Widget Requirements

Codex should implement reusable widgets instead of repeating UI code inside screens.

### Suggested Shared Widgets

Place general reusable widgets in:

```txt
lib/shared/widgets/
```

Recommended widgets:

1. `AppCard`
   - Reusable rounded surface container
   - Supports tonal surface colors
   - Supports optional padding and child

2. `AppGradientButton`
   - Primary CTA button
   - Uses signature gradient
   - Rounded pill shape

3. `AppSecondaryButton`
   - Soft secondary button
   - No hard border

4. `AppTextField`
   - Soft filled input field
   - Focus styling based on `DESIGN.md`

5. `PulseChip`
   - Used for income/expense/category indicators

6. `AmountText`
   - Reusable financial amount display
   - Handles large hero numbers and smaller list amounts

7. `GlassBottomNav`
   - Consistent bottom navigation
   - Uses glassmorphism where feasible

8. `SectionHeader`
   - Reusable section title row

---

## 7. Feature Widget Requirements

Feature-specific widgets should be placed inside their feature folders.

Recommended structure:

```txt
lib/features/
├─ auth/
│  └─ presentation/
│     ├─ screens/
│     └─ widgets/
├─ dashboard/
│  └─ presentation/
│     ├─ screens/
│     └─ widgets/
├─ transactions/
│  └─ presentation/
│     ├─ screens/
│     └─ widgets/
└─ budget/
   └─ presentation/
      ├─ screens/
      └─ widgets/
```

### Auth Widgets

- `AuthHeader`
- `AuthCard`
- `SocialLoginButton`

### Dashboard Widgets

- `BalanceHeroCard`
- `MonthlySummaryCard`
- `SpendingOverviewCard`
- `RecentTransactionList`
- `QuickActionCard`

### Transaction Widgets

- `TransactionTypeSelector`
- `AmountEntry`
- `TransactionForm`
- `TransactionListItem`
- `TransactionFilterBar`
- `TransactionEmptyState`

### Budget Widgets

- `BudgetOverviewCard`
- `BudgetCategoryCard`
- `BudgetProgressIndicator`
- `BudgetInsightPanel`

---

## 8. Mock Data Requirements

Use mock data first unless backend integration is explicitly requested.

Recommended mock data files:

```txt
lib/features/dashboard/data/mock_dashboard_data.dart
lib/features/transactions/data/mock_transactions.dart
lib/features/budget/data/mock_budget_data.dart
```

Mock transaction object should include:

```txt
id
title
amount
type
category
date
paymentMethod
description or note
```

Mock budget object should include:

```txt
id
category
limit
spent
month
status
```

---

## 9. Models

Create simple models if needed.

Recommended model files:

```txt
lib/models/transaction.dart
lib/models/budget.dart
lib/models/category.dart
```

### Transaction Model Fields

- `id`
- `title`
- `amount`
- `type`
- `category`
- `date`
- `paymentMethod`
- `note`

### Budget Model Fields

- `id`
- `category`
- `limit`
- `spent`
- `month`

### Category Model Fields

- `id`
- `name`
- `icon`
- `type`

---

## 10. State and Backend Scope

### Current Scope

- Use local mock data.
- No backend connection required.
- No real authentication required.
- Buttons can navigate or act as placeholders if backend is not ready.

### Out of Scope for Initial UI Build

- Real login/register API
- Persistent database storage
- Real transaction CRUD
- Real budget calculations from backend
- Push notifications
- Analytics engine
- Profile settings
- Dark mode implementation

---

## 11. Visual Compliance Checklist

The UI should match `docs/DESIGN.md`.

Before finishing, check:

- Uses light cyan/teal surface system.
- Uses rounded cards and buttons.
- Avoids pure black text.
- Avoids visible 1px dividers for transaction lists.
- Avoids harsh shadows.
- Uses tonal layering instead of rigid borders.
- Uses primary gradient for main CTA buttons.
- Uses soft input fields.
- Uses Pulse Chips or equivalent subtle labels for income/expense.
- Uses generous whitespace.
- Keeps important numbers highly readable.
- Does not look like a dense banking dashboard.

---

## 12. Flutter Implementation Checklist

Before considering the UI complete:

- Screens are split into reusable widgets.
- Large UI is not placed directly inside one screen file.
- Common widgets are placed in `lib/shared/widgets`.
- Feature widgets are placed in their feature folders.
- Colors are not repeatedly hardcoded in screens.
- Theme files exist or are updated.
- Layout uses `SafeArea`.
- Long screens are scrollable.
- No horizontal overflow exists.
- Tap targets are comfortable.
- `const` constructors are used where possible.
- No unnecessary packages are added.

---

## 13. Verification Commands

Before finishing, run:

```bash
flutter analyze
flutter test
```

If tests do not exist yet, at minimum run:

```bash
flutter analyze
```

Fix any analyzer errors before reporting completion.

---

## 14. Codex Prompt Example

Use this prompt when asking Codex to implement the UI:

```txt
Read AGENTS.md, docs/DESIGN.md, and docs/UI_REQUIREMENTS.md.

Implement the Azure Ledger Flutter UI using mock data first.

Start with the Home Dashboard screen.

Requirements:
1. Follow the Translucent Sanctuary design system in docs/DESIGN.md.
2. Create reusable shared widgets for cards, buttons, text fields, amount text, Pulse Chips, and bottom navigation.
3. Put shared widgets in lib/shared/widgets.
4. Put dashboard-specific widgets in lib/features/dashboard/presentation/widgets.
5. Put the Dashboard screen in lib/features/dashboard/presentation/screens/dashboard_screen.dart.
6. Use mock data only.
7. Do not connect to backend.
8. Do not add new packages unless necessary.
9. Run flutter analyze and fix issues.
```

---

## 15. Acceptance Criteria Summary

The initial UI implementation is acceptable when:

- Login screen exists.
- Register screen exists.
- Home Dashboard exists.
- Add Transaction screen exists.
- Transactions History screen exists.
- Budget screen exists.
- Bottom navigation is consistent across authenticated screens.
- UI follows `DESIGN.md`.
- Mock data is used.
- Reusable widgets are created.
- Flutter analyzer passes.
