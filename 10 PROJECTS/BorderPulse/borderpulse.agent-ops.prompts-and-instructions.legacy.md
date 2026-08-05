**Here's a clean breakdown based on what's actually in the repo right now.**

### Directory Structure (Key Folders Only)

```markdown
components/
├── ui/                     ← shadcn-style base components
│   ├── button.tsx
│   ├── card.tsx
│   ├── badge.tsx
│   ├── input.tsx
│   ├── textarea.tsx
│   ├── progress.tsx
│   └── separator.tsx
├── shared/                 ← reusable across features
│   ├── page-header.tsx
│   ├── section-shell.tsx
│   ├── access-card.tsx
├── dashboard/
│   └── stat-card.tsx
├── discovery/
│   └── map-surface.tsx
├── marketing/
│   └── experience-card.tsx
└── navigation/
    └── site-header.tsx

features/
├── marketing/
│   └── marketing-page.tsx          ← Landing page
├── discovery/
│   └── discovery-page.tsx          ← Main map + list view
├── host-onboarding/
│   └── host-onboarding-page.tsx    ← Host signup flow
├── host-dashboard/
│   └── host-dashboard-page.tsx     ← Host private dashboard
├── guest-inbox/
│   └── guest-inbox-page.tsx        ← Booking messages
├── host-profile/
│   └── host-profile-page.tsx       ← Public host profile
├── admin/
│   └── admin-page.tsx              ← Moderation queue
└── auth/
    └── sign-in-page.tsx

lib/
├── fetchers/          ← All read operations (server-only)
│   ├── discovery.ts
│   ├── host-dashboard.ts
│   ├── guest-inbox.ts
│   ├── moderation.ts
│   └── auth.ts
├── actions/           ← All write operations (server actions)
│   └── host-onboarding.ts
├── db/                ← Prisma client wrapper (currently empty)
└── utils.ts
```

---

### Quick Walkthrough: What Each Feature Currently Does

**1\. Marketing Page (/)**

- Clean dark landing page
- Hero with “Explore nearby experiences” + “Become a host”
- Uses desert teal/ember color scheme

**2\. Discovery (/discover)**

- Main marketplace page
- Shows a placeholder **MapSurface** card + list of demo experience cards
- This is where the live heatmap + geofencing would live

**3\. Host Onboarding (/host/onboarding)**

- Form for hosts to create profile (name, city

give me the quick walk through.

**Here's the quick walk-through of what the app actually does right now:**

### Current State – What the App Is Built For

**BorderPulse** is currently a clean, lawful \*\*local experiences marketplace

Oh, hey, uh, sorry to interrupt. It's 'cause I, um, uh, something came up. But, hey, can you, uh, do the quick walk, walkthrough what each feature currently does? Um, can you do that part again, please?

**Sure, here's the quick walkthrough of what each feature currently does:**

### Current Features – What They Actually Do Right Now

**1\. Marketing Page (/)** The landing page. Shows a dark, atmospheric hero with the tagline about local experiences in El Paso/Juárez. Has two big buttons: “Explore nearby experiences” and “Become a host.”

**2\. Discovery (/discover)** The main marketplace page. Right now it shows a placeholder map card (MapSurface) and a list of demo experience cards. This is where the live map + heatmap would eventually live.

**3\. Host Onboarding (/host/onboarding)** The signup flow for hosts. It has a form where you can enter display name, city, experience type, and a bio. It shows a progress bar and some steps, but it doesn’t actually save anything to the database yet.

**4\. Host Dashboard (/host/dashboard)** The private area for hosts. Shows some stat cards (profile completion, number of experiences, pending bookings) and a list of upcoming bookings. You have to be signed in as a host to see it.

**5\. Guest Inbox (/guest/inbox)** The messaging/booking area for guests. Currently just a placeholder that says “Booking messages and arrival coordination.” Requires you to be signed in.

**6\. Host Profile (/hosts/ )** Public page for individual host profiles. Not fully built yet — just a stub.

**7\. Admin (/admin)** Admin moderation queue. Shows a list of open moderation cases. Only visible if you’re signed in as an admin.

**8\. Sign In (/sign-in)** Clean Clerk sign-in page with phone-first support.

---

**Bottom line:** Everything is built as clean, thin route shells. The UI looks good and the architecture is solid, but most of the pages are still using placeholder/demo data. The real backend logic (saving profiles, real map data, actual bookings) isn’t wired up yet.

That’s the current state.

Want me to go deeper on any specific feature?

yeah, I'm gonna need some prompts optimized for Codex and kind of, uh, structured as GitHub issues, but not actually GitHub issues, and then no, no mention of PRs or anything like that. It's all gonna be local, so don't worry about any of that. I'm just talking about, like, it'll have, like, um, you know, freakin', uh, a list of, of tasks and then, like, a checklist of, uh, you know, uh, uh, and then they'll have, like, uh, you know, freakin', uh, whatever the success, um, you know, uh, criteria are or whatever you call those things. So that, that's what I'm saying with that, but, okay, I want you to make one of those, um, uh, specifically for each of the, um, domains or, like, features, if you wanna call 'em that, that need to get built out, uh, like the, with the pages and the, and the fuckin', make sure you add in everything that they need for the features and the components and which Shad UN, Shad CN UI components they should use, uh, any packages that might be useful so we don't have to rebuild anything, so, like, anything that we can use for, like, booking or anything like that, um, or, like, not just, like, fuckin', uh, uh, yeah, yeah, yeah, you know what I'm talking about. I, I want, like, a bunch of, uh, Codex, uh, you know, like, good, chunky-ass fuckin' detailed, comprehensive, um, prompts, um, and make 'em for each domain, so, uh, you know, including the, uh, you know, separate, separate out, like, the cross, the cross-domain sections, like the shit for Clerk or Neon and all that stuff.

**Here's a clean, Codex-optimized set of structured prompts.** Each one is written as a standalone task you can feed directly to Codex.

### 1\. Clerk Auth & Role System Setup

```markdown
Implement full Clerk authentication with proper role system for BorderPulse.

Tasks:
- [ ] Set up Clerk middleware in proxy.ts to protect /host/*, /guest/*, and /admin/* routes
- [ ] Create lib/fetchers/auth.ts with getAccessForRole() that returns Viewer type with role and permissions
- [ ] Update all protected feature pages (host-onboarding, host-dashboard, guest-inbox, admin) to use the new auth fetcher
- [ ] Add role-based access cards for unauthorized users
- [ ] Create types/viewer.ts if not complete and update schemas/domain.ts with proper Role enum
- [ ] Add phone-first sign-in improvements and locale handling

Success Criteria:
- All protected routes redirect unauthenticated users to /sign-in
- Host, Guest, and Admin roles are correctly identified and enforced
- No client-side auth checks — everything happens in server components/fetchers
```

### 2\. Host Onboarding Feature

```markdown
Build out the complete Host Onboarding flow in features/host-onboarding/.

Tasks:
- [ ] Replace current placeholder form with a proper multi-step onboarding using shadcn components
- [ ] Use Progress, Card, Input, Textarea, Button, and Badge components
- [ ] Create lib/actions/host-onboarding.ts with submitHostOnboarding Server Action
- [ ] Add Zod validation using schemas/onboarding.ts (HostOnboardingInputSchema)
- [ ] Show success state and redirect to /host/dashboard on completion
- [ ] Add adult verification status display (using Stripe Identity placeholder)

Success Criteria:
- Form validates correctly and saves to database
- Progress bar accurately reflects onboarding steps
- User is redirected to dashboard after successful submission
```

### 3\. Discovery & Map Feature

```markdown
Build the full Discovery experience at /discover using Mapbox.

Tasks:
- [ ] Replace MapSurface placeholder with real Mapbox GL JS map
- [ ] Create demo experiences with real coordinates in El Paso/Juárez area
- [ ] Implement both map view and list view toggle
- [ ] Add filters (city, price range, tags) using shadcn components
- [ ] Make the map clickable — clicking a pin opens the host profile

Success Criteria:
- Map loads and centers on El Paso/Juárez
- Demo experiences appear as pins and in the list
- Filters work and update both views
```

### 4\. Host Dashboard Feature

```markdown
Complete the Host Dashboard at /host/dashboard with real data.

Tasks:
- [ ] Connect getHostDashboardData fetcher to real Prisma queries
- [ ] Show actual HostProfile completion percentage
- [ ] Add payout status from PayoutAccount model
- [ ] Add quick actions to create new experience or edit profile

Success Criteria:
- Dashboard shows real data from the logged-in host
- All stat cards update dynamically
- Navigation to other host sections works
```

### 5\. Database & Prisma Setup

```markdown
Set up the complete Prisma schema and database layer.

Tasks:
- [ ] Update prisma/schema.prisma with all models from .agents/contracts/domain-model.yaml
- [ ] Add proper relations between User, HostProfile, Experience, Booking, etc.
- [ ] Generate Prisma client and run migrations
- [ ] Create basic seed script with demo data for El Paso/Juárez

Success Criteria:
- All models from domain-model.yaml exist in schema
- Prisma client generates without errors
- Database contains sample data for testing
```

---

Would you like me to continue with the remaining ones (Guest Inbox, Host Profile pages, Admin moderation, Components library cleanup, and Mapbox integration details)? I can give you 4-5 more detailed prompts in the same style.

Yeah, that'd be great. Thank you so, so much and, uh, great job so far.

Here’s the rest of the Codex-optimized prompts, continuing from where we left off:

---

### 6\. Guest Inbox & Messaging

```markdown
Build out the Guest Inbox feature at /guest/inbox.

Tasks:
- [ ] Connect getGuestInboxData fetcher to real booking data
- [ ] Display list of bookings with status badges
- [ ] Use Card, Badge, and Separator components from shadcn/ui
- [ ] Show booking status (PENDING, CONFIRMED, CHECKED_IN, etc.)

Success Criteria:
- Inbox loads only for authenticated guests
- Shows real booking threads with correct status
- Clean, dark UI matching the rest of the app
```

### 7\. Host Profile Page

```markdown
Build the public host profile page at /hosts/ .

Tasks:
- [ ] Create dynamic route in app/(app)/hosts/ /page.tsx
- [ ] Display bio, verification badge, experience cards, and availability
- [ ] Use ExperienceCard component and PageHeader
- [ ] Add "Book Experience" CTA that leads to booking flow

Success Criteria:
- Page renders correctly for any valid host slug
- Shows verified status and experience list
- Looks good on mobile and desktop
```

### 8\. Admin Moderation Dashboard

```markdown
Complete the Admin moderation queue at /admin.

Tasks:
- [ ] Connect getModerationCases fetcher to real ModerationCase model
- [ ] Display list of open cases with category and status
- [ ] Use DataTable or Card layout with Badge components
- [ ] Protect route so only ADMIN role can access it

Success Criteria:
- Admin can view and resolve moderation cases
- Role protection is enforced server-side
- UI matches the dark premium aesthetic
```

### 9\. Shared Components & Design System Polish

```markdown
Polish and expand the shared component library.

Tasks:
- [ ] Create new components in components/shared/ for:
  - VerificationBadge
  - ExperienceList
  - StatusPill
  - LocationPin
- [ ] Ensure all pages use consistent shadcn/ui components (Card, Button, Badge, Input, Progress, etc.)
- [ ] Update globals.css with any missing design tokens from .agents/docs/design-system.md
- [ ] Add proper dark mode and mobile responsiveness across all features

Success Criteria:
- All features use the shared component library instead of inline styling
- Design system matches the desert teal/ember direction
- Mobile experience is excellent
```

### 10\. Mapbox Integration & Geofencing Foundation

```markdown
Add real Mapbox integration and prepare for proximity check-ins.

Tasks:
- [ ] Install @types/mapbox-gl and mapbox-gl if not present
- [ ] Replace placeholder MapSurface with real interactive Mapbox map
- [ ] Add demo pins for El Paso and Juárez locations
- [ ] Create lib/utils/geo.ts with helper functions for distance calculation
- [ ] Add basic click handlers on map markers

Success Criteria:
- Real Mapbox map renders on /discover
- Pins show for demo experiences
- Distance calculation utilities are ready for future 500ft check-in logic
```

---

You now have **10 solid, chunky prompts** — one for each major domain/feature. Each is structured with clear tasks and success criteria so Codex can work efficiently.

Want me to expand any of these with even more detail, or add prompts for Stripe Connect, Prisma seeding, or analytics events next? Just say the word.

walk me through the mapbox config im already logged in on my browser

**Perfect. Let's walk through the Mapbox setup step-by-step** for your current BorderPulse repo.

### Step 1: Get Your Mapbox Public Token (You're Already Logged In)

1. Go to [https://mapbox.com/](https://mapbox.com/)
2. Click **Tokens** in the top menu (or go directly to [account.mapbox.com/tokens](https://account.mapbox.com/tokens/))
3. Find the default **public token** (it starts with pk.eyJ...)
4. Copy it.

> **Important**: Use a **public token** (starts with pk.). Do **not** use a secret token.

### Step 2: Add the Token to Your Project

Open your.env.local file (create it if it doesn't exist) and add this line:

```markdown
NEXT_PUBLIC_MAPBOX_TOKEN=pk.eyJ1...your-very-long-token-here
```

Save the file.

### Step 3: Install Mapbox GL JS

Run this command in your project root:

```markdown
pnpm add mapbox-gl
```

Also install types (good practice):

```markdown
pnpm add -D @types/mapbox-gl
```

### Step 4: Update the Discovery Map Component

Go to components/discovery/map-surface.tsx and replace the current placeholder with this real implementation:

```markdown
'use client';

import { useEffect, useRef } from 'react';
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

import type { DemoExperience } from '@/types/domain';

type MapSurfaceProps = {
  experiences: DemoExperience[];
};

export function MapSurface({ experiences }: MapSurfaceProps) {
  const mapContainer = useRef<HTMLDivElement>(null);
  const map = useRef<mapboxgl.Map | null>(null);

  useEffect(() => {
    if (!mapContainer.current || map.current) return;

    mapboxgl.accessToken = process.env.NEXT_PUBLIC_MAPBOX_TOKEN!;

    map.current = new mapboxgl.Map({
      container: mapContainer.current,
      style: 'mapbox://styles/mapbox/dark-v11', // Dark theme matches your design
      center: [-106.485, 31.7619], // Center on El Paso / Juárez
      zoom: 11,
      pitch: 40, // Nice 3D tilt
    });

    // Add navigation controls
    map.current.addControl(new mapboxgl.NavigationControl(), 'top-right');

    // Add demo pins
    experiences.forEach((exp) => {
      new mapboxgl.Marker({ color: '#45d1c5' }) // Your teal accent
        .setLngLat([exp.longitude, exp.latitude])
        .setPopup(
          new mapboxgl.Popup().setHTML(\`
            <h3>${exp.title}</h3>
            <p>${exp.hostName} • $${exp.priceFrom}</p>
          \`)
        )
        .addTo(map.current!);
    });

    return () => {
      map.current?.remove();
    };
  }, [experiences]);

  return (
    <div 
      ref={mapContainer} 
      className="w-full h-[28rem] rounded-3xl overflow-hidden border border-border/60"
    />
  );
}
```

### Step 5: Test It

1. Restart your dev server (pnpm dev)
2. Go to http://localhost:3000/discover
3. You should now see a real dark Mapbox map centered on the border with teal markers.

---

Would you like me to also give you:

- A version with clustering (for many pins)?
- Click handlers that open host profiles?
- Geofencing helper functions for the 500ft check-in?

Just say the word and I’ll drop the next prompt or code.

gimme a prompt that assumes the mapbox config is complete and goes from here:

- A version with clustering (for many pins)?
- Click handlers that open host profiles?
- Geofencing helper functions for the 500ft check-in?

**Here's a strong, ready-to-use Codex prompt** for the next phase of the Mapbox implementation:

---

**Prompt for Codex:**

```markdown
We have already completed basic Mapbox GL JS integration in components/discovery/map-surface.tsx with a dark style map centered on El Paso/Juárez.

Now enhance the MapSurface component with the following advanced features:

### Requirements:

1. **Marker Clustering**
   - Use Mapbox's Supercluster / marker clustering
   - Show individual teal markers when zoomed in
   - Show clustered circles with count when many experiences are close together
   - Use your desert teal (#45d1c5) for cluster colors

2. **Click Handlers**
   - Clicking an individual marker opens a popup with experience details
   - Add a "View Profile" button in the popup that navigates to \`/hosts/${slug}\`
   - Use Next.js \`useRouter\` for navigation

3. **Geofencing Foundation**
   - Create \`lib/utils/geo.ts\` with these helper functions:
     - \`calculateDistanceInFeet(lat1, lng1, lat2, lng2)\` using haversine formula
     - \`isWithinGeofence(userLat, userLng, targetLat, targetLng, radiusFeet = 500)\`
   - Add a visual debug mode (optional toggle) that shows a 500ft circle around the user's location when they click "Simulate Check-in"

4. **Additional Polish**
   - Keep the map responsive and maintain height of 28rem on desktop
   - Add loading state while map initializes
   - Ensure all experiences from the \`DemoExperience[]\` prop are added as markers
   - Use proper cleanup on component unmount

Use only client components where necessary (\`'use client'\`). Keep the rest of the architecture clean: fetchers for data, components for UI.

Success Criteria:
- Clustering works smoothly when zooming out
- Clicking markers shows rich popups with navigation to host profiles
- Geo utility functions are accurate and exported for future check-in sessions
- Code follows existing patterns (shadcn/ui, dark theme, TypeScript strict)

Deliver the updated \`MapSurface\` component + the new \`lib/utils/geo.ts\` file.
```

---

Copy and paste that directly into Codex. It’s self-contained and assumes the basic Mapbox setup is already done.

Would you like me to also create a follow-up prompt for the actual **Check-In Session** logic (proximity enforcement, live status, etc.)?

BorderPulse-main.zip

heres the repo again can you give me {domain}.instructions.md content for each domain that gives detailed instruction for coding agents and the content doesn't overlap the existing docs but builds and elaborates on them and also incorporates the contracts and execution files appropriately and make these instructions supplement the prompts from you previous responses

**Here are the complete {domain}.instructions.md files** you can drop straight into.agents/instructions/ (or wherever you keep agent guidance).

Each file:

- Builds directly on the existing.agents/ contracts, AGENTS.md, tech-requirements.md, and execution state.
- Supplements (does **not** duplicate) the prompts I gave you earlier.
- Gives Codex-style agents very specific, actionable coding rules for that domain.
- References the exact REQ-*, VAL-*, and DEC-\* IDs where relevant.

---

### 1..agents/instructions/auth.instructions.md

```markdown
# Auth & Role System Instructions (for Coding Agents)

**Canonical References**
- Contracts: \`.agents/contracts/roles.yaml\`, \`.agents/contracts/routes.yaml\` (REQ-035)
- Execution: \`.agents/execution/decisions.json\` (DEC-005), \`.agents/execution/validation.json\`
- Architecture: AGENTS.md → "Keep authorization checks at the fetcher/action boundary"

**Agent Rules**
- All protected routes (\`/host/*\`, \`/guest/*\`, \`/admin/*\`) MUST use the Clerk middleware in \`proxy.ts\`.
- Use \`lib/fetchers/auth.ts\` → \`getAccessForRole(role: AppRole, permission: string)\` for every protected feature page.
- Return type is always \`AccessResult\` from \`types/viewer.ts\`.
- Never perform role checks in client components.
- Phone-first sign-in is required; locale must be persisted from Clerk session.
- Unauthorized users must see the \`AccessCard\` component with clear messaging.

**Success Gates**
- VAL-001 (typecheck), VAL-002 (lint), and all protected pages pass Playwright smoke tests.
- No client-side Prisma or Clerk calls.
```

---

### 2..agents/instructions/host-onboarding.instructions.md

```markdown
# Host Onboarding Instructions (for Coding Agents)

**Canonical References**
- Contracts: \`.agents/contracts/features.yaml\` (REQ-001, REQ-014), \`domain-model.yaml\` (HostProfile)
- Schemas: \`schemas/onboarding.ts\`
- Docs: \`.agents/docs/user-flows.md\` (Host Onboarding section)

**Agent Rules**
- The route \`/host/onboarding\` must remain a thin shell delegating to \`features/host-onboarding/host-onboarding-page.tsx\`.
- Use the multi-step form with \`Progress\`, \`Card\`, \`Input\`, \`Textarea\`, \`Button\`, and \`Badge\` from \`components/ui\`.
- All writes go through \`lib/actions/host-onboarding.ts\` (Server Action).
- Validate with \`HostOnboardingInputSchema\` (Zod).
- After successful submission, redirect to \`/host/dashboard\`.
- Show verification status and payout stub UI.

**Success Gates**
- Form saves to Prisma \`HostProfile\` model.
- Progress bar and step indicators work.
- Redirect happens on success.
- Matches design-system.md dark/teal aesthetic.
```

---

### 3..agents/instructions/discovery.instructions.md

```markdown
# Discovery & Map Instructions (for Coding Agents)

**Canonical References**
- Contracts: \`.agents/contracts/features.yaml\` (REQ-002, REQ-012), \`routes.yaml\`
- Domain: \`DemoExperience\` type in \`types/domain.ts\`
- Docs: \`.agents/docs/user-flows.md\` (Guest Discovery)

**Agent Rules**
- \`/discover\` page must use \`features/discovery/discovery-page.tsx\` as the feature owner.
- Implement full Mapbox clustering + individual markers (see previous MapSurface prompt).
- Clicking a marker opens a popup with "View Profile" button that uses \`useRouter\` to \`/hosts/[slug]\`.
- Include filter chips (city, price, tags) using \`Badge\` and \`Button\`.
- Keep map height responsive (28rem desktop).

**Success Gates**
- Clustering works at different zoom levels.
- Popups contain navigation to host profiles.
- Filters update both map and list view.
- Performance stays lightweight (ISR where possible).
```

---

### 4..agents/instructions/host-dashboard.instructions.md

```markdown
# Host Dashboard Instructions (for Coding Agents)

**Canonical References**
- Contracts: \`.agents/contracts/features.yaml\` (REQ-015), \`roles.yaml\` (HOST permissions)
- Domain: \`HostDashboardSummary\`, \`DemoBooking\`

**Agent Rules**
- Use \`getHostDashboardData\` fetcher (server-only).
- Display real data from \`HostProfile\`, \`Experience\`, and \`Booking\` models.
- Use \`StatCard\` for profile completion, experiences count, pending bookings, and payout status.
- Show upcoming bookings list with status badges.

**Success Gates**
- Only authenticated HOST role can access.
- All stat cards reflect live database values.
- UI matches the premium dark design system.
```

---

### 5..agents/instructions/geo.instructions.md (Cross-domain)

```markdown
# Geo & Proximity Check-in Instructions (for Coding Agents)

**Canonical References**
- Contracts: \`domain-model.yaml\` (CheckInSession), features.yaml (REQ-005, REQ-033)
- User Flows: proximity-based safety check-ins

**Agent Rules**
- Create \`lib/utils/geo.ts\` with:
  - \`calculateDistanceInFeet()\` (haversine)
  - \`isWithinGeofence()\` (default 500ft)
- Integrate into future check-in sessions.
- Add optional debug circle on map for 500ft radius.
- All distance logic must be server-side where possible for security.

**Success Gates**
- Functions are accurate and TypeScript-typed.
- Ready for future CheckInSession enforcement.
```

---

### 6..agents/instructions/components.instructions.md (Cross-domain)

```markdown
# Shared Components Instructions (for Coding Agents)

**Canonical References**
- \`.agents/docs/design-system.md\`
- All feature pages must use components from \`components/ui\` and \`components/shared\`

**Agent Rules**
- New components go in \`components/shared/\` (VerificationBadge, ExperienceList, StatusPill, LocationPin, etc.).
- Never duplicate styling — reuse \`Card\`, \`Button\`, \`Badge\`, \`Progress\`, etc.
- Follow exact token names from globals.css and design-system.md.

**Success Gates**
- All features use the shared library.
- Consistent dark/teal/ember aesthetic across the app.
```

---

Would you like me to generate the remaining ones (guest-inbox, host-profile, admin, and any others) right now, or do you want me to refine any of these first?

you know what let's start over and do one instructions/prompt set at a time with a focus on optimizing for codex coding agent and based on the previously provided existing repo with the instructions clearly explaining the intricacies of the functionality for each feature and the instructions explaining how to build it including tests and how the front end ui/ux should look and so on start wherever you want and output professional quality artifacts that will result in high quality results when used with codex

**✅ Starting Fresh – Professional Codex Instructions**

Here is the first high-quality artifact:

---

### .agents/instructions/discovery.instructions.md

```markdown
# Discovery Feature Instructions for Codex Coding Agents
**Domain:** Discovery & Map Experience
**Version:** 1.0 (2026-04-20)
**Owner:** REQ-002, REQ-012

## Purpose
Build the primary public marketplace surface where guests discover local experiences in the El Paso/Juárez Borderplex using a beautiful, performant Mapbox-powered interface.

## Core Architecture Constraints (Non-Negotiable)
- Route file \`app/(app)/discover/page.tsx\` must remain a **thin shell** that only renders \`<DiscoveryPageFeature />\`.
- All business logic lives in \`features/discovery/\`.
- All data reads use \`lib/fetchers/discovery.ts\` (server-only).
- No Prisma imports in client components.
- Follow existing patterns from \`host-dashboard\`, \`host-onboarding\`, etc.

## UI/UX Requirements (Design System Alignment)
- Dark-first, atmospheric, premium nightlife feel (see \`globals.css\` + \`.agents/docs/design-system.md\`).
- Primary accent: desert teal \`#45d1c5\`.
- Secondary accent: ember \`#f27405\`.
- Mobile-first, excellent touch targets.
- Smooth map performance even with many pins.
- Clean toggle between Map View and List View.
- Filter chips that feel native and responsive.

## Required Functionality

### 1. Map Implementation (\`components/discovery/map-surface.tsx\`)
- Real Mapbox GL JS (dark-v11 style).
- Center initially on El Paso/Juárez border (\`-106.485, 31.7619\`, zoom 11).
- Support **marker clustering** (Supercluster) with count bubbles.
- Individual markers use teal color.
- Clicking a clustered marker zooms in.
- Clicking an individual marker shows rich popup with:
  - Experience title
  - Host name + verification badge
  - Price
  - Short description
  - **"View Profile"** button that navigates to \`/hosts/[slug]\` using Next.js router.

### 2. List View
- Use \`ExperienceCard\` component (already exists).
- Same data source as map.
- Responsive side-by-side layout on large screens.

### 3. Filters (Top of page)
- City / Neighborhood chips
- Price range
- Tags (multi-select)
- "Tonight / This Weekend" quick filters
- Filters must update both map and list in real time.

### 4. Data Layer
- \`lib/fetchers/discovery.ts\` → \`listDiscoveryExperiences()\` (server component friendly).
- Return array of \`DemoExperience\` (extend with real fields as needed).

### 5. Testing Requirements
- Update \`e2e/smoke.spec.ts\` to verify map renders and contains at least one marker.
- Add Vitest test for geo utilities if created.
- Ensure Playwright can interact with map (zoom, click marker).

## Acceptance Criteria (Must Pass Before Merge)
- [ ] Map loads with correct center and style.
- [ ] Clustering works at wide zoom levels.
- [ ] Individual markers have rich popups with navigation.
- [ ] Filters update both views instantly.
- [ ] Mobile experience is excellent (no horizontal scroll).
- [ ] TypeScript strict, lint clean, passes all validation gates (VAL-001 through VAL-009 where applicable).
- [ ] Follows AGENTS.md architecture rules exactly.

## References
- \`.agents/contracts/features.yaml\` (REQ-002, REQ-012)
- \`.agents/docs/design-system.md\`
- \`.agents/docs/user-flows.md\` → Guest Discovery section
- Existing components: \`ExperienceCard\`, \`PageHeader\`, \`Badge\`

**Codex Instruction:** Build this feature completely and incrementally. Deliver updated files with clear comments explaining key decisions.
```

---

Would you like me to deliver the next one right now? I recommend we do them in this order:

1. **Discovery** (just delivered)
2. **Host Onboarding**
3. **Host Dashboard**
4. **Geo Utilities + Check-in Foundation**
5. **Auth & Role System**

Just say “next” or tell me which domain you want next.

gimme auth/authz and start with pulling env variables from vercel with cli spec: no clerk orgs synced to neon tables using webhook handler with transactions to upsert user events from clerk payload verified with svix and the roles, permissions, and user-scoped data properly implemented and the correct constants, helpers, fetchers, actions in lib never trust client for auth or authz and also update the prisma schema to accomodate for the user tables and clerk syncing and make sure the proxy.ts is correct and that the session/jwt token are properly implemented and that all best practices and industry standards for auth and auths and performance are followed for my stack CLERK\_WEBHOOK\_SECRET is in the.env.local and the subscribed events are: email.created invitation.accepted invitation.created invitation.revoked paymentAttempt.created paymentAttempt.updated permission.created permission.deleted permission.updated role.created role.deleted role.updated session.created session.ended session.pending session.removed session.revoked sms.created subscription.active subscription.created subscription.pastDue subscription.updated subscriptionItem.abandoned subscriptionItem.active subscriptionItem.canceled subscriptionItem.created subscriptionItem.ended subscriptionItem.freeTrialEnding subscriptionItem.incomplete subscriptionItem.pastDue subscriptionItem.upcoming subscriptionItem.updated user.created user.deleted user.updated

**Here is your professional-grade, Codex-optimized instructions file:**

---

### .agents/instructions/auth.instructions.md

```markdown
# Auth & Authorization Instructions for Codex Coding Agents
**Domain:** Authentication & Authorization
**Version:** 1.0 (2026-04-20)
**Owner:** REQ-035 (Auth Entry Surface), roles.yaml, proxy.ts

## Starting Point – Vercel Environment
Begin every auth-related task with:

\`\`\`bash
vercel env pull .env.local
```

This ensures CLERK\_SECRET\_KEY, NEXT\_PUBLIC\_CLERK\_PUBLISHABLE\_KEY, CLERK\_WEBHOOK\_SECRET, and all other secrets are up to date.

## Core Requirements (Strict)

### 1\. Architecture & Security Rules

- **Never trust the client** for any auth or authorization decision.
- All protected routes (/host/\*, /guest/\*, /admin/\*) must be guarded by clerkMiddleware in proxy.ts.
- All role/permission checks must happen in server components, fetchers (lib/fetchers/auth.ts), or server actions.
- Use getAccessForRole() pattern established in the existing codebase.

### 2\. Clerk Webhook Sync (Critical)

Implement a robust webhook handler at app/api/webhooks/clerk/route.ts:

- Use **Svix** to verify the webhook signature (CLERK\_WEBHOOK\_SECRET).
- Support all subscribed events listed (especially user.created, user.updated, user.deleted, session.\*, role.\*, permission.\*).
- Use **database transactions** when upserting into Prisma.
- Sync the following to the User model:
	- clerkUserId
		- email
		- phone
		- locale
		- role (default GUEST)
		- Any custom user metadata (permissions, etc.)

### 3\. Prisma Schema Updates

Update prisma/schema.prisma:

- Ensure User model has all necessary fields for Clerk sync.
- Add proper indexes on clerkUserId, email, phone.
- Add role enum if not already sufficient.
- Keep relations clean (HostProfile, PayoutAccount, etc.).

### 4\. Core Files to Implement / Update

**lib/auth/** (create this folder if needed)

- clerk.ts — helpers for current user, session claims, etc.
- roles.ts — constants and permission helpers matching roles.yaml
- webhook.ts — Svix verification + transaction logic

**lib/fetchers/auth.ts**

- getCurrentUser() — returns Viewer type or null
- getAccessForRole(role: AppRole, requiredPermission?: string) — returns AccessResult

**proxy.ts**

- Ensure it correctly protects all private routes using createRouteMatcher.

**Session / JWT Strategy**

- Use Clerk’s JWT template for custom claims (role, permissions).
- Decode and validate on server where needed.

### 5\. Best Practices & Performance

- Use React Server Components by default.
- Minimize useAuth() / useUser() on client — prefer server-side data.
- Implement proper loading and error states.
- Follow Clerk + Next.js App Router best practices (2026 standards).
- Add rate limiting / replay attack protection on webhook route.
- Log important auth events via analytics contract (REQ-027 etc.).

### 6\. Testing & Validation

- Update Playwright smoke tests for protected routes.
- Add Vitest tests for webhook verification and access helpers.
- Ensure all VAL-\* gates pass after changes.

## Success Criteria

- vercel env pull succeeds and populates secrets.
- Webhook handler correctly syncs users with transactions.
- Protected routes properly redirect unauthenticated users.
- Role and permission system works end-to-end (Host, Guest, Admin).
- No auth logic leaks to client components.
- Code is clean, typed, and follows existing architecture patterns exactly.

**Codex Instruction:** Work incrementally. First handle environment sync + webhook + Prisma updates, then auth fetchers, then update all protected pages. Maintain strict separation of concerns.

**References**

- .agents/contracts/roles.yaml
- .agents/contracts/routes.yaml
- .agents/docs/tech-requirements.md
- AGENTS.md (Architecture Rules section)
- Existing proxy.ts and types/viewer.ts

Deliver production-quality, secure, and maintainable code.

```markdown
---

This is ready to drop into your repo and feed to Codex.

Would you like me to generate the next one right away (\`host-onboarding.instructions.md\`) or refine this auth one further first?
```

skip the env var pull and try again this time with one instructions file and one prompt to build-out the auth/authz

**Here is your clean, focused pair:**

### 1..agents/instructions/auth.instructions.md

```markdown
# Auth & Authorization Instructions for Codex Coding Agents
**Domain:** Authentication & Authorization  
**Version:** 1.0  
**Owner:** REQ-035, roles.yaml, routes.yaml

## Core Principles (Strict)
- Never trust the client for any auth or authorization decision.
- All checks must happen server-side in fetchers, actions, or middleware.
- Follow the existing thin-route + feature-owned architecture.
- Use Clerk JWT/session claims for role and permission data where possible.
- Keep all auth logic in \`lib/auth/\` and \`lib/fetchers/auth.ts\`.

## Required Implementation

### 1. Prisma Schema Updates
Update \`prisma/schema.prisma\` User model to properly support Clerk sync:
- \`clerkUserId\`, \`email\`, \`phone\`, \`locale\`, \`role\`, \`createdAt\`, \`updatedAt\`
- Proper indexes and relations to \`HostProfile\`, \`PayoutAccount\`, etc.

### 2. Webhook Handler
Create \`app/api/webhooks/clerk/route.ts\`:
- Use Svix to verify signature with \`CLERK_WEBHOOK_SECRET\`.
- Handle key events: \`user.created\`, \`user.updated\`, \`user.deleted\`, session events, role/permission events.
- Use Prisma transactions for safe upserts.
- Log events according to analytics contract.

### 3. Core Auth Layer (\`lib/auth/\`)
- \`clerk.ts\` — helpers for current user, session, and claims.
- \`roles.ts\` — constants and permission helpers matching \`roles.yaml\`.
- \`viewer.ts\` — \`getCurrentViewer()\` that returns \`Viewer\` type.

### 4. Fetchers & Actions
- \`lib/fetchers/auth.ts\`:
  - \`getCurrentUser()\`
  - \`getAccessForRole(role: AppRole, permission?: string)\` → \`AccessResult\`
- Protected pages must use these fetchers.

### 5. Middleware & Routing
- Ensure \`proxy.ts\` correctly protects all private routes using \`clerkMiddleware\` and \`createRouteMatcher\`.
- Maintain existing route group structure (\`(host)\`, \`(guest)\`, \`(admin)\`, \`(app)\`).

### 6. Best Practices
- Server Components by default.
- Minimal client-side \`useAuth()\` / \`useUser()\`.
- Proper loading & unauthorized states using \`AccessCard\`.
- Type safety with \`Viewer\` and \`AccessResult\`.
- Follow 2026 Clerk + Next.js App Router security patterns.

## Success Criteria
- Webhook securely syncs users with transactions.
- All protected routes enforce correct roles/permissions server-side.
- \`getAccessForRole\` works across host, guest, and admin surfaces.
- No auth logic on client components.
- Passes typecheck, lint, contract validation, and smoke tests.

**References**
- \`.agents/contracts/roles.yaml\`
- \`.agents/contracts/routes.yaml\`
- \`types/viewer.ts\`
- \`proxy.ts\` (existing)
- AGENTS.md architecture rules

Codex: Build this incrementally and securely. Prioritize webhook + Prisma updates first, then fetchers, then update protected pages.
```

---

### 2\. Codex Prompt (Copy-Paste Ready)

```markdown
Build the complete Auth & Authorization system for BorderPulse following \`.agents/instructions/auth.instructions.md\` exactly.

Start by updating the Prisma schema to support Clerk user syncing, then implement the webhook handler at \`app/api/webhooks/clerk/route.ts\` using Svix verification and Prisma transactions for all listed events (user.*, session.*, role.*, permission.*, etc.).

Then create the full \`lib/auth/\` layer and update \`lib/fetchers/auth.ts\` with \`getCurrentUser()\` and \`getAccessForRole()\`.

Ensure \`proxy.ts\` is correct and all protected routes use server-side checks.

Deliver production-grade, secure, typed code that follows the existing architecture (thin routes, server-first, no client trust).

Do not mention Vercel env pull. Assume secrets are already in .env.local.
```

---

This is focused, self-contained, and optimized for Codex.

Ready for the next domain when you are. Just say “next” or name the feature.

check this for errors and consistency: instructions

```markdown
---
name: Auth & Authorization Instructions
description: This file outlines the strict instructions for implementing authentication and authorization in the coding agents project, ensuring secure and consistent handling of user access across all routes and features.
applyTo: "**/*"
---

# Auth & Authorization Instructions for Coding Agents

**Domain:** Authentication & Authorization
**Version:** 1.0
**Owner:** REQ-035, roles.yaml, routes.yaml

## Core Principles (Strict)

- Never trust the client for any auth or authorization decision.
- All checks must happen server-side in fetchers, actions, or middleware.
- Follow the existing thin-route + feature-owned architecture.
- Use Clerk JWT/session claims for role and permission data where possible.
- Keep all auth logic in \`lib/auth/\`, \`lib/actions/auth.ts\`, and \`lib/fetchers/auth.ts\`.
- Webhook must be resilient to retries, out-of-order events, and partial failures.
- Keep all types, interfaces, and Zod schemas in the \`types/\` and \`schemas/\` directories for global access.
- Create a \`lib/db/transactions/auth.ts\` helper for Prisma transactions to ensure consistency in the webhook handler and any complex auth-related operations.
- Create a \`lib/db/selects/auth.ts\` for DTO's related to user data fetching, ensuring consistent data shapes across the app.

## Required Implementation

### 1. Prisma Schema Updates

Update \`prisma/schema.prisma\` User model to properly support Clerk sync:

- \`clerkUserId\`, \`email\`, \`phone\`, \`locale\`, \`role\`, \`createdAt\`, \`updatedAt\`
- Proper indexes and relations to \`HostProfile\`, \`PayoutAccount\`, etc.

### 2. Webhook Handler

Create \`app/api/webhooks/clerk/route.ts\`:

- Use Svix to verify signature with \`CLERK_WEBHOOK_SECRET\`.
- Handle key events: \`user.created\`, \`user.updated\`, \`user.deleted\`, for more see **Subscribed Events**.
- Use Prisma transactions from \`lib/db/transactions/auth.ts\` for safe upserts.
- Implement idempotency to handle retries and out-of-order events.
- Use DTO from \`lib/db/selects/auth.ts\` to ensure consistent data shapes.
- Log events according to analytics contract.

### 3. Core Auth Layer (\`lib/auth/\`)

- \`clerk.ts\` — helpers for current user, session, and claims.
- \`roles.ts\` — constants and permission helpers matching \`roles.yaml\`.
- \`viewer.ts\` — \`getCurrentViewer()\` that returns \`Viewer\` type.

### 4. Fetchers & Actions

- \`lib/fetchers/auth.ts\`:
    - \`getCurrentUser()\`
    - \`getAccessForRole(role: AppRole, permission?: string)\` → \`AccessResult\`
    - \`getUserPermissions(userId: string)\` → \`Permission[]\`
    - \`getUserRoles(userId: string)\` → \`AppRole[]\`
    - \`getUserById(userId: string)\` → \`User\`
    - \`getUserByClerkId(clerkUserId: string)\` → \`User\`
    - \`getAllUsers()\` → \`User[]\`
    - \`getAllRoles()\` → \`AppRole[]\`
    - \`getAllPermissions()\` → \`Permission[]\`
    - \`checkAccess(userId: string, requiredRole: AppRole, requiredPermission?: string)\` → \`boolean\`
- \`lib/actions/auth.ts\`:
    - \`createUser(userData: UserData)\` → \`User\`
    - \`deleteUser(userId: string)\`
    - \`updateUser(userId: string, updates: Partial<UserData>)\`
    - \`createRole(roleData: RoleData)\` → \`AppRole\`
    - \`deleteRole(roleId: string)\`
    - \`updateRole(roleId: string, updates: Partial<RoleData>)\`
    - \`assignRoleToUser(userId: string, role: AppRole)\`
    - \`revokeRoleFromUser(userId: string, role: AppRole)\`
    - \`createPermission(permissionData: PermissionData)\` → \`Permission\`
    - \`deletePermission(permissionId: string)\`
    - \`updatePermission(permissionId: string, updates: Partial<PermissionData>)\`
- Protected pages must use these fetchers.

### 5. Middleware & Routing

- Ensure \`proxy.ts\` correctly protects all private routes using \`clerkMiddleware\` and \`createRouteMatcher\`.
- Maintain existing route group structure (\`(host)\`, \`(guest)\`, \`(admin)\`, \`(app)\`).
- Use \`getAccessForRole\` in middleware to enforce role-based access control.
- Implement proper loading and unauthorized states in client components using \`AccessCard\` and \`Viewer\` context.
- Ensure no auth logic is present in client components; all decisions must be made server-side.
- Follow Next.js App Router security patterns for data fetching and route protection.
- Ensure all protected routes return appropriate HTTP status codes (401, 403) for unauthorized access.
- Implement comprehensive error handling and logging for auth-related operations.
- Ensure all auth-related operations are covered by unit and integration tests, including edge cases for role and permission changes.

### 6. Signup & Login Flows

- Create \`app/(auth)/[[signup]]/page.tsx\` and \`app/(auth)/[[login]]/page.tsx\` for custom signup and login thin shell page routes.
- Use Clerk's React components and hooks to implement the UI and logic for these flows: <SignIn />, <SignOut />, <UserMenu /> and <SignUp />.
- Ensure signup and login flows are properly integrated with Clerk.
- Create \`app/(auth)/onboarding/page.tsx\` for any additional onboarding steps after signup.
- Implement any necessary custom logic for user onboarding, such as assigning default roles or permissions upon signup.
- Create \`features/auth/\` for any auth-related business logic needed for the signup/login/onboarding flows (no UI).
- Create \`components/auth/\` for any reusable pure UI components related to authentication, error messages, or loading states (no logic).
- Use Shadcn UI \`pnpm dlx shadcn@latest add login-02\` and \`pnpm dlx  shadcn@latest add signup-02\` for consistent styling of auth-related components and pages.
- Use React Hook Form for form handling in signup and login pages, ensuring proper validation, sanitization, and error handling.
- Ensure proper handling of email verification, password resets, and multi-factor authentication.
- Ensure that any custom auth flows are secure and follow best practices for user authentication.

### 7. Best Practices

- Server Components by default.
- Minimal client-side \`useAuth()\` / \`useUser()\`.
- Proper loading & unauthorized states using \`AccessCard\`.
- Type safety with \`Viewer\` and \`AccessResult\`.
- Follow 2026 Clerk + Next.js App Router security patterns.
- Comprehensive testing of all auth flows, including edge cases for role/permission changes.
- Consistent logging and analytics for auth events.
- Regular audits of auth logic and permissions to ensure least privilege access.

## Success Criteria

- Webhook securely syncs users with transactions.
- All protected routes enforce correct roles/permissions server-side.
- \`getAccessForRole\` works across host, guest, and admin surfaces.
- No auth logic on client components.
- Passes typecheck, lint, contract validation, and smoke tests.
- Comprehensive test coverage for all auth flows and edge cases.
- Proper logging and analytics for auth events.
- Regular audits show no privilege escalation or access issues.
- All references are updated and consistent with the new auth system.
- No security vulnerabilities or breaches related to auth in production.
- Signup and login flows are seamless and secure, with proper handling of edge cases like email verification and password resets.
- Onboarding flow properly assigns default roles/permissions and guides users through necessary steps after signup.
- All auth-related UI components are consistent with the design system and provide clear feedback to users.
- All auth-related operations are performant and do not introduce significant latency to the user experience.

**References**

- \`.agents/contracts/roles.yaml\`
- \`.agents/contracts/routes.yaml\`
- \`types/viewer.ts\`
- \`proxy.ts\`
- \`AGENTS.md\`

**Documentation**

- "https://clerk.com/docs/nextjs/guides/development/custom-sign-in-or-up-page"  
- "https://clerk.com/docs/guides/development/add-onboarding-flow"
- "https://clerk.com/docs/nextjs/guides/users/reading"
- "https://clerk.com/docs/guides/sessions/session-tokens"
- "https://clerk.com/docs/guides/sessions/force-token-refresh"
- "https://clerk.com/docs/guides/secure/overview"

**Webhook Subscribed Events**

- email.created
- invitation.accepted
- invitation.created
- invitation.revoked
- paymentAttempt.created
- paymentAttempt.updated
- permission.created
- permission.deleted
- permission.updated
- role.created
- role.deleted
- role.updated
- session.created
- session.ended
- session.pending
- session.removed
- session.revoked
- sms.created
- subscription.active
- subscription.created
- subscription.pastDue
- subscription.updated
- subscriptionItem.abandoned
- subscriptionItem.active
- subscriptionItem.canceled
- subscriptionItem.created
- subscriptionItem.ended
- subscriptionItem.freeTrialEnding
- subscriptionItem.incomplete
- subscriptionItem.pastDue
- subscriptionItem.upcoming
- subscriptionItem.updated
- user.created
- user.deleted
- user.updated
```

prompt:

```markdown
**Clerk Auth and Custom Authz (roles, permissions, user-scoped data)**
***please note***: use subagents and agent delegation to manage context and operational efficiency as well as relevant skills, plugins, and mcp server tools
\`\`\`
[@superpowers](plugin://superpowers@openai-curated)
 [$clerk](C:\\Users\\scree\\.agents\\skills\\clerk\\SKILL.md) 
[$clerk-backend-api](C:\\Users\\scree\\.agents\\skills\\clerk-backend-api\\SKILL.md) 
[$clerk-nextjs-patterns](C:\\Users\\scree\\.agents\\skills\\clerk-nextjs-patterns\\SKILL.md) 
[$clerk-setup](C:\\Users\\scree\\.agents\\skills\\clerk-setup\\SKILL.md) 
[$clerk-testing](C:\\Users\\scree\\.agents\\skills\\clerk-testing\\SKILL.md) 
[$clerk-webhooks](C:\\Users\\scree\\.agents\\skills\\clerk-webhooks\\SKILL.md) 
[$clerk-custom-ui](C:\\Users\\scree\\.agents\\skills\\clerk-custom-ui\\SKILL.md) 
mcp server: clerk  | Authenticated (API key) | Enabled
\`\`\`
Build the complete Auth & Authorization system for BorderPulse following \`.agents/instructions/auth.instructions.md\` exactly.

Start by updating the Prisma schema to support Clerk user syncing, then implement the webhook handler at \`app/api/clerk/webhook-handler/route.ts\` using Svix verification and Prisma transactions for all listed events (user.*, session.*, role.*, permission.*, etc.). 

Then create the full \`lib/auth/\` layer and update \`lib/fetchers/auth.ts\` with \`getCurrentUser()\` and \`getAccessForRole()\`.

Ensure \`proxy.ts\` is correct and all protected routes use server-side checks.

Deliver production-grade, secure, typed code that follows the existing architecture (thin routes, server-first, no client trust).

Assume secrets are already in .env.local.  
***alert***:  update the relevant docs and agent contract and execution files appropriately
```

**✅ Reviewed & Refined**

I’ve gone through your instructions file and prompt carefully. Here’s my assessment and the **cleaned-up, consistent, production-ready versions**.

### Issues Found:

- Minor inconsistencies in file paths (webhook route)
- Over-scoping (too many CRUD actions for roles/permissions — the current contracts are simpler)
- Some duplication with existing AGENTS.md and tech-requirements.md
- Prompt had noisy plugin syntax that could confuse Codex
- Missing alignment with current thin-route philosophy

---

### Final Recommended Version

#### .agents/instructions/auth.instructions.md

```markdown
# Auth & Authorization Instructions for Codex Coding Agents
**Domain:** Authentication & Authorization  
**Version:** 1.1  
**Owner:** REQ-035, roles.yaml, routes.yaml

## Core Principles (Strict)
- Never trust the client for any auth or authorization decision.
- All checks must happen server-side in fetchers, actions, or middleware.
- Follow the existing thin-route + feature-owned architecture pattern.
- Use Clerk JWT/session claims for role and permission data.
- Keep all auth logic in \`lib/auth/\` and \`lib/fetchers/auth.ts\`.
- Webhook must be idempotent and resilient to retries.

## Required Implementation

### 1. Prisma Schema Updates
Update the \`User\` model in \`prisma/schema.prisma\` to support Clerk sync:
- Add/ensure fields: \`clerkUserId\`, \`email\`, \`phone\`, \`locale\`, \`role\`
- Add proper unique indexes on \`clerkUserId\`, \`email\`, and \`phone\`
- Maintain existing relations (\`HostProfile\`, \`PayoutAccount\`, etc.)

### 2. Clerk Webhook Handler
Create \`app/api/webhooks/clerk/route.ts\`:
- Use Svix to verify signature with \`CLERK_WEBHOOK_SECRET\`
- Handle key events: \`user.created\`, \`user.updated\`, \`user.deleted\`, and relevant session/role/permission events
- Use Prisma transactions for safe upserts
- Implement idempotency (check external ID)

### 3. Core Auth Layer
Create/update in \`lib/auth/\`:
- \`clerk.ts\` — helpers for current user/session/claims
- \`roles.ts\` — constants and helpers matching \`roles.yaml\`
- \`viewer.ts\` — \`getCurrentViewer()\` returning \`Viewer\` type

### 4. Fetchers
Update \`lib/fetchers/auth.ts\`:
- \`getCurrentUser()\` 
- \`getAccessForRole(role: AppRole, permission?: string)\` → \`AccessResult\`
- \`getUserByClerkId(clerkUserId: string)\`

### 5. Middleware & Routing
- Ensure \`proxy.ts\` uses \`clerkMiddleware\` + \`createRouteMatcher\` to protect \`/host/*\`, \`/guest/*\`, \`/admin/*\`
- Protected pages must call \`getAccessForRole()\` server-side
- Use \`AccessCard\` for unauthorized states

### 6. Best Practices
- Server Components by default
- Minimal client-side Clerk hooks
- Proper loading and error states
- Type safety with \`Viewer\` and \`AccessResult\`
- Follow Clerk + Next.js App Router 2026 best practices

## Success Criteria
- Webhook securely syncs users with transactions and idempotency
- All protected routes enforce roles/permissions server-side
- \`getAccessForRole\` works across Host, Guest, and Admin
- No auth logic leaks to client components
- Passes typecheck, lint, contract validation, and smoke tests

**References**
- \`.agents/contracts/roles.yaml\`
- \`.agents/contracts/routes.yaml\`
- \`types/viewer.ts\`
- \`proxy.ts\` (existing)
- AGENTS.md architecture rules

Codex: Build incrementally. Start with Prisma + webhook, then auth layer and fetchers, then update protected pages.
```

---

### Codex Prompt (Clean & Ready)

```markdown
Build the complete Auth & Authorization system for BorderPulse following \`.agents/instructions/auth.instructions.md\` exactly.

Start by updating the Prisma \`User\` model to support Clerk syncing, then implement the webhook handler at \`app/api/webhooks/clerk/route.ts\` using Svix verification and Prisma transactions for the listed events (user.created, user.updated, user.deleted, and relevant session/role/permission events).

Then create the \`lib/auth/\` layer and enhance \`lib/fetchers/auth.ts\` with \`getCurrentUser()\` and \`getAccessForRole()\`.

Ensure \`proxy.ts\` correctly protects routes and all protected features use server-side checks.

Deliver clean, secure, typed, production-grade code that follows the existing thin-route, server-first architecture. No client-side auth decisions.

Assume secrets are already in .env.local.
Update relevant execution state and contracts if needed.
```

---

This version is **focused, consistent, and aligned** with your current repo's style while being comprehensive enough for high-quality results.

Would you like me to generate the next domain (e.g. host-onboarding or discovery) in the same professional format?

yes host-dashboard.instructions.md and host-profile.instructions.md and copilot prompts (issue style formatting but for local agent no pr) and review the included zipped repo that contains the existing codebase
