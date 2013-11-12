<?php

namespace Directorzone\Controller;

use Netsensia\Controller\NetsensiaActionController;
use Zend\Mvc\MvcEvent;

class AdminController extends NetsensiaActionController
{
	public function onDispatch(MvcEvent $e) 
	{
		if (!$this->isLoggedOn()) {
			return $this->redirect()->toRoute('login');
		}
		
		parent::onDispatch($e);
	}

    public function indexAction()
    {
        $this->redirect()->toRoute('admin-companies');
    }
    
    public function companiesAction()
    {
    }
    
}