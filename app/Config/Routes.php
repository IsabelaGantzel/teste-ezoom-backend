<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->post('register', 'Auth::register');

$routes->post('login', 'Auth::login');

$routes->group('notifications', ['filter' => 'jwtAuth'], function($routes) {
    $routes->post('/',                 'Notification::create');
    $routes->get('(:num)',             'Notification::show/$1');
    $routes->put('mark-as-read/(:num)','Notification::update/$1');
});
