---
name: laravel-inertia-vuejs-structure
description: Frontend structure conventions for Laravel Inertia VueJS applications based on Spatie's production practices. Use when creating, scaffolding, or reviewing frontend code in a Laravel Inertia VueJS project. Triggers on creating Vue components, pages, modules, organizing frontend directories, setting up Inertia pages, structuring a Vue frontend within Laravel, or when the user asks about frontend file organization in an Inertia app.
---

# Laravel Inertia React Frontend Structure

## Directory Structure

Four base directories under `resources/js`:

```
resources/js/
├── api/          # Helpers for calls to API routes without page reloads
├── composables/  # Functions that leverages Vue's Composition API to encapsulate and reuse stateful logic.
├── Layouts/      # Inertia page layouts
├── Pages/        # Inertia page components
└── Shared/       # Components that are shared among multiple Pages
```

**Component location**: If the Component is used between multiple other Components outside the same namespace, the Component file should be in `Shared`. Otherwise the Component can be in a `Partials` directory, which is a sibling of the file where the Compnent is used.

## Naming Conventions

- **Components**: `PascalCase` (e.g. `Button.vue`, `AuthContext.vue`)
- **Other files** (helpers, composables, constants, stores): `camelCase` (e.g. `useAuth.ts`, `formatDate.ts`)
- **Directories**: `kebab-case` (e.g. `date-picker/`, `user-management/`), except `Layouts`, `Pages`, `Shared`, and their sub-directories.

## Pages Directory

Pages mirror the URL structure. Components are not suffixed with `Page`.

```
Pages/
├── Layouts/              # Global layouts
├── WorkOrders/
│   ├── Partials/         # Section-specific Components
│   ├── Create.vue
│   ├── Edit.vue
│   └── Index.vue
└── Auth/
    ├── Login.vue
    └── Register.vue
```

### Import Organization

Two blocks separated by a blank line: library imports first, then application imports. Use absolute paths with aliases (`@/`):

```tsx
import { onMounted, ref, watchEffect } from 'vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

import JetAuthenticationCard from '@/Jetstream/AuthenticationCard.vue';
import JetButton from '@/Shared/Button.vue';
```

## Stylesheets

Use Tailwind. Single `app.css` for most projects. Larger projects split into:

```
resources/css/
├── base/
├── components/
└── utilities/
```
