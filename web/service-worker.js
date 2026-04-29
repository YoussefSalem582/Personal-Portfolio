// Service Worker for caching and faster loads
const CACHE_PREFIX = 'ysh-portfolio';
const VERSION_URL = '/Youssef-Salem-Portfolio/version.json';
const CRITICAL_ASSETS = [
  '/Youssef-Salem-Portfolio/',
  '/Youssef-Salem-Portfolio/index.html',
  '/Youssef-Salem-Portfolio/main.dart.js',
  '/Youssef-Salem-Portfolio/flutter_bootstrap.js',
  '/Youssef-Salem-Portfolio/assets/assets/images/portfolio_logo.jpg',
  '/Youssef-Salem-Portfolio/assets/assets/images/profile.jpg',
  '/Youssef-Salem-Portfolio/favicon.png',
  '/Youssef-Salem-Portfolio/manifest.json'
];

// Resolve cache name dynamically so each deployment invalidates the old cache
async function resolveCacheName() {
  try {
    const response = await fetch(VERSION_URL, { cache: 'no-store' });
    if (response && response.ok) {
      const versionData = await response.json();
      const version = versionData?.appVersion || versionData?.flutterVersion || versionData?.frameworkVersion;
      if (version) {
        return `${CACHE_PREFIX}-v${version}`;
      }
    }
  } catch (error) {
    console.warn('[ServiceWorker] Unable to fetch version.json, falling back to timestamp:', error);
  }

  return `${CACHE_PREFIX}-${Date.now()}`;
}

const cacheNamePromise = resolveCacheName();

// Install event - cache critical assets
self.addEventListener('install', (event) => {
  console.log('[ServiceWorker] Installing...');
  event.waitUntil(
    (async () => {
      try {
        const cacheName = await cacheNamePromise;
        const cache = await caches.open(cacheName);
        console.log('[ServiceWorker] Caching critical assets');
        await cache.addAll(CRITICAL_ASSETS);
      } catch (error) {
        console.error('[ServiceWorker] Failed to cache critical assets:', error);
      }
    })()
  );
  self.skipWaiting();
});

// Activate event - clean old caches
self.addEventListener('activate', (event) => {
  console.log('[ServiceWorker] Activating...');
  event.waitUntil(
    (async () => {
      const cacheName = await cacheNamePromise;
      const cacheKeys = await caches.keys();
      await Promise.all(
        cacheKeys
          .filter((cache) => cache !== cacheName && cache.startsWith(CACHE_PREFIX))
          .map((cache) => {
            console.log('[ServiceWorker] Deleting old cache:', cache);
            return caches.delete(cache);
          })
      );
    })()
  );
  return self.clients.claim();
});

// Fetch event - serve from cache, fallback to network
self.addEventListener('fetch', (event) => {
  // Skip non-GET requests
  if (event.request.method !== 'GET') return;

  // Skip external requests
  if (!event.request.url.startsWith(self.location.origin)) return;

  event.respondWith(
    (async () => {
      const cacheName = await cacheNamePromise;
      const cache = await caches.open(cacheName);
      const cachedResponse = await cache.match(event.request);

      if (cachedResponse) {
        console.log('[ServiceWorker] Serving from cache:', event.request.url);
        return cachedResponse;
      }

      try {
        const networkResponse = await fetch(event.request);
        if (networkResponse && networkResponse.ok && networkResponse.type !== 'error') {
          await cache.put(event.request, networkResponse.clone());
        }
        return networkResponse;
      } catch (error) {
        console.error('[ServiceWorker] Fetch failed:', error);
        throw error;
      }
    })()
  );
});
