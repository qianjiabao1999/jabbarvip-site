# Sync kjzyz VPS Products Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add the misaka and CloudSilk VPS products from `kjzyz` to `jabbarvip-site` without changing unrelated target-site content.

**Architecture:** Preserve the existing static single-page product array. Add two data objects and their local SVG assets, then protect the synchronization with focused Node built-in tests that read the HTML and assets directly.

**Tech Stack:** Static HTML/JavaScript, SVG, Node.js `node:test`

---

### Task 1: Add failing product synchronization tests

**Files:**
- Create: `tests/homepage-products.test.mjs`

- [ ] **Step 1: Write focused tests for both missing products**

Create `tests/homepage-products.test.mjs` using `readFileSync`, `node:test`, and `node:assert/strict`. Assert that `index.html` contains the misaka and CloudSilk IDs, names, descriptions, `scenes: ['vps']`, logo paths, `logoWide: true`, and exact affiliate URLs. Read both SVG files and assert their accessible labels. Also assert `VPS 专线（10 个 affiliate）` and count exactly ten `scenes: ['vps']` occurrences.

- [ ] **Step 2: Run the test to verify it fails**

Run: `node --test tests/homepage-products.test.mjs`

Expected: FAIL because `assets/logos/misaka.svg` and `assets/logos/cloudsilk.svg` do not exist in the target repository.

- [ ] **Step 3: Commit the failing test**

```bash
git add tests/homepage-products.test.mjs
git commit -m "test: cover synced VPS products"
```

### Task 2: Add the two VPS product records and assets

**Files:**
- Modify: `index.html:1029-1103`
- Create: `assets/logos/misaka.svg`
- Create: `assets/logos/cloudsilk.svg`

- [ ] **Step 1: Copy the source SVG assets exactly**

Copy `assets/logos/misaka.svg` and `assets/logos/cloudsilk.svg` from the current `kjzyz` checkout into the same paths in `jabbarvip-site`.

- [ ] **Step 2: Append the misaka product object**

Add after the 搬瓦工 object:

```js
  {
    id: 'misaka', symbol: 'Mi', name: 'misaka', slogan: 'Cloud Server',
    description: '云服务器与全球网络服务，适合自建海外网络节点',
    color: '#111827', scenes: ['vps'],
    logoUrl: 'assets/logos/misaka.svg',
    logoWide: true,
    recommended: false, badge: null,
    affiliateUrl: 'https://www.misaka.io/services/mc2'
  },
```

- [ ] **Step 3: Append the CloudSilk product object**

Add immediately after misaka:

```js
  {
    id: 'cloudsilk', symbol: 'CS', name: 'CloudSilk', slogan: '大陆优化 BGP',
    description: '大陆优化 BGP 云服务器，适合自建海外网络节点',
    color: '#336699', scenes: ['vps'],
    logoUrl: 'assets/logos/cloudsilk.svg',
    logoWide: true,
    recommended: false, badge: null,
    affiliateUrl: 'https://cloudsilk.io/aff.php?aff=928'
  },
```

- [ ] **Step 4: Update the section annotation**

Change `VPS 专线（8 个 affiliate）` to `VPS 专线（10 个 affiliate）`.

- [ ] **Step 5: Run the focused test to verify it passes**

Run: `node --test tests/homepage-products.test.mjs`

Expected: 2 tests pass, 0 tests fail.

- [ ] **Step 6: Commit the implementation**

```bash
git add index.html assets/logos/misaka.svg assets/logos/cloudsilk.svg
git commit -m "feat: sync new VPS products from kjzyz"
```

### Task 3: Verify and publish

**Files:**
- Verify: `index.html`
- Verify: `tests/homepage-products.test.mjs`
- Verify: `assets/logos/misaka.svg`
- Verify: `assets/logos/cloudsilk.svg`

- [ ] **Step 1: Run the full available test suite**

Run: `node --test tests/*.test.mjs`

Expected: all tests pass with zero failures.

- [ ] **Step 2: Check formatting and final scope**

Run: `git diff --check origin/main...HEAD && git diff --stat origin/main...HEAD && git status --short --branch`

Expected: no whitespace errors; only the design, plan, focused test, two SVG assets, and `index.html` are changed; the working tree is clean.

- [ ] **Step 3: Push the approved change**

Run: `git push origin HEAD:main`

Expected: the target repository’s `main` branch advances successfully.
