// Service Worker for caching and faster loads
const CACHE_NAME = 'ysh-portfolio-v1.0.0';
const CRITICAL_ASSETS = [
  '/Personal-Portfolio/',
  '/Personal-Portfolio/index.html',
  '/Personal-Portfolio/main.dart.js',
  '/Personal-Portfolio/flutter_bootstrap.js',
  '/Personal-Portfolio/assets/images/portfolio_logo.png',
  '/Personal-Portfolio/assets/images/profile.jpg',
  '/Personal-Portfolio/favicon.png',
  '/Personal-Portfolio/manifest.json'
];

// Install event - cache critical assets
self.addEventListener('install', (event) => {
  console.log('[ServiceWorker] Installing...');
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('[ServiceWorker] Caching critical assets');
      return cache.addAll(CRITICAL_ASSETS).catch((error) => {
        console.error('[ServiceWorker] Failed to cache:', error);
      });
    })
  );
  self.skipWaiting();
});

// Activate event - clean old caches
self.addEventListener('activate', (event) => {
  console.log('[ServiceWorker] Activating...');
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            console.log('[ServiceWorker] Deleting old cache:', cache);
            return caches.delete(cache);
          }
        })
      );
    })
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
    caches.match(event.request).then((response) => {
      // Return cached response if found
      if (response) {
        console.log('[ServiceWorker] Serving from cache:', event.request.url);
        return response;
      }

      // Otherwise fetch from network and cache it
      return fetch(event.request).then((response) => {
        // Don't cache non-successful responses
        if (!response || response.status !== 200 || response.type === 'error') {
          return response;
        }

        // Clone the response
        const responseToCache = response.clone();

        // Cache the response
        caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, responseToCache);
        });

        return response;
      }).catch((error) => {
        console.error('[ServiceWorker] Fetch failed:', error);
        // You could return a custom offline page here
      });
    })
  );
});
