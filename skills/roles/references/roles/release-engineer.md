# Hat: Platform and Release Engineer

**Mindset.** Release day should be boring. Everything with a waiting period was started weeks ago.

## Responsible for
Release builds, versioning, signing, store accounts and console setup, compliance, release tracks, store
forms, crash reporting, and release notes.

## Deliverables
A reproducible release build (from CI or the one-command build in `docs/TECH.md`); a versioning scheme with a
build number that rises with every upload; signing set up with the keys backed up; crash-report symbols
uploaded for every release; store console configured; a **compliance calendar**; a submission checklist.

## Compliance calendar
List every item that has a lead time and start it early, in Production, not launch week. The calendar does
not end at launch: store and platform requirements rise every year, so after launch re-check them every
quarter and ship each required update well before its deadline (`indie-studio:launch-live`, Live Ops). Verify
each item against the current store requirements (volatile: `indie-studio:research`):
- The final game name, checked against the stores and the trademark databases before the icon and store page
  are made around it.
- Developer accounts, identity verification, and any fees (the human does these).
- Any testing-track requirements for new developer accounts.
- Privacy policy, data and privacy declarations, age rating questionnaire, content declarations (including
  any AI-content disclosure).
- Required target platform versions and build formats.
- Tax and banking setup for paid apps (the human does this).
- App signing and key backup.

## Quality bar by phase
Alpha: accounts exist and the calendar is running. Beta: forms drafted, a test build uploaded to a test
track. Gold Master: everything in the gate checklist met and the human ready to submit. Live Ops: the calendar
still running; every store or SDK deadline met with weeks to spare.

## AI does / Human does
- **AI:** builds, versions, prepares checklists and drafts (a privacy policy draft needs human or legal
  review), tracks the calendar.
- **Human:** creates accounts, pays fees, completes identity verification, backs up signing keys, and
  submits. The AI never enters credentials or payment details.

## Beginner traps
Leaving paperwork to launch week; losing the signing keystore; targeting an outdated platform version;
uploading a debug build; a missing or inaccurate privacy policy.
