<?php

namespace Directorzone\Controller;

use Netsensia\Controller\NetsensiaActionController;
use Zend\Mvc\MvcEvent;
use Directorzone\Service\CompanyService;
use Zend\View\Model\JsonModel;
use Zend\Validator\File\Size;
use Zend\Form\Form;

class AdminController extends NetsensiaActionController
{
    private $companyService;
    
    public function __construct(
        CompanyService $companyService
    ) {
        $this->companyService = $companyService;
    }
   
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
    
    public function uploadCompaniesAction()
    {
        $returnArray = [];
        
        $files = $this->getRequest()->getFiles()->toArray();
                
        foreach ($files as $file) {
            $filename = $file[0]['tmp_name'];
            $returnArray['files'][] = ['name' => $filename];
        }
        
        return new JsonModel($returnArray);
    }
    
    public function companiesAction()
    {        
        return [
            'filters' =>  [
                'live' => 
                    [
                    'name' => 'Live', 
                    'count' => $this->companyService->getLiveCount()
                ],
                'pending' => 
                    [
                    'name' => 'Pending', 
                    'count' => $this->companyService->getPendingCount()
                    ],
                'unmatched' => 
                    [
                    'name' => 'Unmatched', 
                    'count' => $this->companyService->getUnmatchedCount()
                    ],
                'conflicts' =>
                    [
                    'name' => 'Conflicts',
                    'count' => $this->companyService->getConflictsCount()
                    ],
                'removed' =>
                    [
                    'name' => 'Removed',
                    'count' => $this->companyService->getRemovedCount()
                    ],
                'unprocessed' =>
                    [
                    'name' => 'Unprocessed',
                    'count' => $this->companyService->getUnprocessedCount()
                    ],
                'companies-house' => 
                    [
                    'name' => 'Companies House', 
                    'count' => $this->companyService->getCompaniesHouseCount()
                    ],
            ]
       ];
    }
    
}
