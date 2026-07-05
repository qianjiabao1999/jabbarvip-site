import { existsSync, readFileSync } from 'node:fs';
import { test } from 'node:test';
import assert from 'node:assert/strict';

const html = readFileSync(new URL('../index.html', import.meta.url), 'utf8');

test('misaka is listed as a VPS provider with its local logo', () => {
  const logoUrl = new URL('../assets/logos/misaka.svg', import.meta.url);

  assert.match(html, /VPS 专线（10 个 affiliate）/);
  assert.equal(html.match(/scenes:\s*\['vps'\]/g)?.length, 10);
  assert.match(html, /id:\s*'misaka'/);
  assert.match(html, /name:\s*'misaka'/);
  assert.match(html, /description:\s*'云服务器与全球网络服务，适合自建海外网络节点'/);
  assert.match(html, /logoUrl:\s*'assets\/logos\/misaka\.svg'/);
  assert.match(html, /logoWide:\s*true/);
  assert.match(html, /affiliateUrl:\s*'https:\/\/www\.misaka\.io\/services\/mc2'/);
  assert.equal(existsSync(logoUrl), true);

  const logo = readFileSync(logoUrl, 'utf8');
  assert.match(logo, /<svg[^>]+aria-label="Misaka\.io"/);
});

test('CloudSilk is listed as a VPS provider with its local logo', () => {
  const logoUrl = new URL('../assets/logos/cloudsilk.svg', import.meta.url);

  assert.match(html, /id:\s*'cloudsilk'/);
  assert.match(html, /name:\s*'CloudSilk'/);
  assert.match(html, /description:\s*'大陆优化 BGP 云服务器，适合自建海外网络节点'/);
  assert.match(html, /logoUrl:\s*'assets\/logos\/cloudsilk\.svg'/);
  assert.match(html, /logoWide:\s*true/);
  assert.match(html, /affiliateUrl:\s*'https:\/\/cloudsilk\.io\/aff\.php\?aff=928'/);
  assert.equal(existsSync(logoUrl), true);

  const logo = readFileSync(logoUrl, 'utf8');
  assert.match(logo, /<svg[^>]+aria-label="CloudSilk"/);
});
