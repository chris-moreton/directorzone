<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/Netsensia for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Netsensia;

use Zend\Mvc\ModuleRouteListener;
use Zend\Log\Writer\Stream;
use Zend\Log\Logger;
use Netsensia\Service\ImageService;
use Netsensia\Service\MessagingService;
use Netsensia\Service\CommentsService;
use Zend\Db\TableGateway\TableGateway;
    
class Module
{

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }
    
    public function getViewHelperConfig()
    {
        return array(
            'invokables' => array(
                'BootstrapForm' => 'Netsensia\Form\View\Helper\BootstrapForm',
                'NewsPanel' => 'Netsensia\View\Helper\NewsPanel',
                'BbCode' => 'Netsensia\View\Helper\BbCode',
                'ArticleComments' => 'Netsensia\View\Helper\ArticleComments',
            ),
            'factories' => array(
                'config' => function ($serviceManager) {
                    $helper = new \Netsensia\View\Helper\Config($serviceManager);
                    return $helper;
                },
            )
        );
    }
    
    public function getServiceConfig()
    {
        return [
            'factories' => array(
                'Zend\Log' => function ($sm) {
                    $log = new Logger();
                    
                    $stream_writer = new Stream('./data/log/application.log');
                    $log->addWriter($stream_writer);
     
                    $log->info('Logging started...');
                    
                    return $log;
                },
                'ImageService' => function (\Zend\ServiceManager\ServiceLocatorInterface $sl) {
                    return new ImageService();
                },
                'UserModel' => function (\Zend\ServiceManager\ServiceLocatorInterface $sl) {
                    $instance = new \Application\Model\User();
                    $instance->setServiceLocator($sl);
                    
                    $instance->setRelation('addressid', 'address');
                    
                    return $instance;
                },
                'FeedbackModel' => function (\Zend\ServiceManager\ServiceLocatorInterface $sl) {
                    $instance = new \Netsensia\Model\Feedback();
                    $instance->setServiceLocator($sl);
                    return $instance;
                },
                'AddressModel' => function (\Zend\ServiceManager\ServiceLocatorInterface $sl) {
                    $instance = new \Netsensia\Model\Address();
                    $instance->setServiceLocator($sl);
                    return $instance;
                },
                'MessagingService' => function($sm) {
                    return new MessagingService(
                        $sm->get('UserMessageTableGateway'),
                        $sm->get('FeedbackTableGateway')
                    );
                },
                'CommentsService' => function($sm) {
                    return new CommentsService(
                        $sm->get('ArticleCommentsTableGateway')
                    );
                },
                'ArticleCommentsTableGateway' => function ($sm) {
                    $instance = new TableGateway(
                        'articlecomment',
                        $sm->get('Zend\Db\Adapter\Adapter')
                    );
                    return $instance;
                },
                'FeedbackTableGateway' => function ($sm) {
                    $instance = new TableGateway(
                        'feedback',
                        $sm->get('Zend\Db\Adapter\Adapter')
                    );
                    return $instance;
                },
                'UserMessageTableGateway' => function ($sm) {
                    $instance = new TableGateway(
                        'usermessage',
                        $sm->get('Zend\Db\Adapter\Adapter')
                    );
                    return $instance;
                },
            ),
        ];
    }

    public function onBootstrap($e)
    {
        // You may not need to do this if you're doing it elsewhere in your
        // application
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }
}
