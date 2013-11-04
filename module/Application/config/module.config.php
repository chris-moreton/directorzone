<?php

return array(
    'controllers' => array(
        'invokables' => array(
            'Application\Controller\Index' => 
                'Application\Controller\IndexController',
        ),
    ),
    'router' => array(
        'routes' => array(
            
            'home' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
            ),
            'company' => array(
                'type' => 'Zend\Mvc\Router\Http\Segment',
                'options' => array(
                    'route'    => '/company/[:companyNumber]',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'company',
                    ),
                ),
            ),
            'company-search' => array(
                'type' => 'Zend\Mvc\Router\Http\Segment',
                'options' => array(
                    'route'    => '/company-search/[:partialName]',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'company-search',
                    ),
                ),
            ),
            'add-to-database' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/add-to-database',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'add-to-database',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'kick' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/[:partialName]',
                            'defaults' => array(
                                'controller' => 'Application\Controller\Index',
                                'action'     => 'add-to-database',
                            ),
                        )
                    ),
                    'count' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/count',
                            'defaults' => array(
                                'controller' => 'Application\Controller\Index',
                                'action'     => 'count',
                            ),
                        )
                    ),
                )
                
            ),
            
        ),
    ),
    
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
            'Zend\Log\LoggerAbstractServiceFactory',
        ),
        'aliases' => array(
            'translator' => 'MvcTranslator',
        ),
        'invokables' => array(
            
        ),
    ),
    
    'translator' => array(
        'locale' => 'en_US',
        'translation_file_patterns' => array(
            array(
                'type'     => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern'  => '%s.mo',
            ),
        ),
    ),
    
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => array(
            'layout/layout' => 
                __DIR__ . '/../view/layout/layout.phtml',
            'application/index/index' => 
                __DIR__ . '/../view/application/index/index.phtml',
            'error/404' => 
                __DIR__ . '/../view/error/404.phtml',
            'error/index'=> 
                __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
            'partial' => __DIR__ . '/../view/application/partials',
        ),
        'strategies' => array(
            'ViewJsonStrategy',
        ),
    ),
);
