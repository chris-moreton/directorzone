<?php
namespace Application\Controller;

use Netsensia\Controller\NetsensiaActionController;

class IndexController extends NetsensiaActionController
{
    public function indexAction()
    {

        return [
            'flashMessages' => $this->getFlashMessages(),
        ];
    }
    
    public function companyAction()
    {
        $companyNumber = $this->params('companyNumber');
        
        $request = $this->getServiceLocator()->get('NetsensiaCompanies\Request\CompanyDetailsRequest');
        $companyModel = $request->loadCompanyDetails($companyNumber);

        $request = $this->getServiceLocator()->get('NetsensiaCompanies\Request\CompanyAppointmentsRequest');
        $companyAppointmentsModel = $request->loadCompanyAppointments(
            $companyNumber,
            $companyModel->getCompanyName(),
            true,
            true
        );
        
        return [
            'company' => $companyModel,
            'appointments' => $companyAppointmentsModel,
        ];
                
    }
    
    public function countAction()
    {
        $companyService = $this->getServiceLocator()->get('CompanyService');
        
        $count = $companyService->count();
    
        return [
            'count' => $count,
        ];
    }
    
    public function ingestAction()
    {
        while (true) {
            try {
                $partialName = file_get_contents('lastname.txt');
                
                $companyService = $this->getServiceLocator()->get('CompanyService');
                
                $done = false;
                
                while (!$done) {
                    $request = $this->getServiceLocator()->get('NetsensiaCompanies\Request\NameSearchRequest');
                    
                    echo $partialName . PHP_EOL;
                    
                    $nameSearchResults = $request->loadResults(
                        $partialName,
                        500,
                        10
                    );
                
                    foreach ($nameSearchResults->getMatches() as $match) {
                        if (!$companyService->isCompanyNumberTaken($match['number'])) {
                            $companyModel = $this->newModel('Company');
                            $companyModel->setData($match);
                            $companyModel->create();
                        }
                        $partialName = $match['name'];
                    }
                    file_put_contents('lastname.txt', $partialName);            
                }
            } catch (\Exception $e) {
                echo PHP_EOL . "Exception: " . $e->getMessage() . PHP_EOL . PHP_EOL;
            }
        }
        
        echo 'Done.' . PHP_EOL;
    }
    
    public function addToDatabaseAction()
    {
        $partialName = $this->params('partialName');
        
        $companyService = $this->getServiceLocator()->get('CompanyService');
    
        if ($partialName == '') {
            $partialName = $companyService->getMaxAlphabeticalCompanyName();
        }
    
        $request = $this->getServiceLocator()->get('NetsensiaCompanies\Request\NameSearchRequest');
        $nameSearchResults = $request->loadResults(
            $partialName,
            50,
            1
        );
    
        foreach ($nameSearchResults->getMatches() as $match) {
            if (!$companyService->isCompanyNumberTaken($match['number'])) {
                $companyModel = $this->newModel('Company');
                $companyModel->setData($match);
                $companyModel->create();
            }
        }
    
        return [
            'partialName' => $partialName,
            'results' => $nameSearchResults->getMatches(),
        ];
    }
    
    public function companySearchAction()
    {
        $partialName = $this->params('partialName');

        $request = $this->getServiceLocator()->get('NetsensiaCompanies\Request\NameSearchRequest');
        $nameSearchResults = $request->loadResults(
            $partialName,
            100
        );
        
        return [
            'partialName' => $partialName,
            'results' => $nameSearchResults->getMatches(),
        ];
    }
}
