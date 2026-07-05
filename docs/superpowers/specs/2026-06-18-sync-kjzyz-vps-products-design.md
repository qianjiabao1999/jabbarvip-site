# Sync kjzyz VPS Products into jabbarvip-site

## Goal

Keep the `jabbarvip-site` “VPS 自建” product list aligned with the current `kjzyz` list by adding the two entries that are missing from `jabbarvip-site`: misaka and CloudSilk.

## Scope

- Add the misaka product card after the existing 搬瓦工 card, matching the current field values and order in `kjzyz`.
- Add the CloudSilk product card after misaka, matching the current field values and affiliate URL in `kjzyz`.
- Copy `assets/logos/misaka.svg` and `assets/logos/cloudsilk.svg` from `kjzyz` into the target repository.
- Update the VPS section annotation from 8 products to 10 products.
- Add focused automated assertions covering both product records, their affiliate URLs, their logos, and the updated VPS count.

## Non-goals

- Do not replace the entire product list or synchronize unrelated airport, residential proxy, AI, or business-tool entries.
- Do not alter existing `jabbarvip-site` branding, copy, layout, deployment scripts, or product ordering outside the two appended VPS entries.
- Do not redesign the product-card component or introduce shared cross-repository data infrastructure.

## Implementation Shape

The change remains data-only within the existing single-page architecture. Two product objects will be appended to the VPS group in `index.html`, and their referenced SVG assets will be added under `assets/logos/`. Tests will follow the repository’s existing Node test conventions.

## Verification

- Run the repository’s full test command and confirm zero failures.
- Confirm both new SVG files exist and are referenced by the matching product objects.
- Confirm the VPS annotation reads 10 and exactly 10 products use `scenes: ['vps']`.
- Inspect the final diff to ensure no unrelated `jabbarvip-site` content changed.
