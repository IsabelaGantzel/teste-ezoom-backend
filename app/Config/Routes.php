<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->group('notifications', function($routes) {
    $routes->post('/', 'Notification::create');
    $routes->get('(:num)', 'Notification::show/$1');
    $routes->put('mark-as-read/(:num)', 'Notification::update/$1');
});
