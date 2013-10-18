<?php

namespace Directorzone\Controller;

use Netsensia\Controller\NetsensiaActionController;
use Zend\EventManager\EventManagerInterface;
use Directorzone\Model\User as UserModel;

class AccountController extends NetsensiaActionController
{
    
    public function indexAction()
    {
        $this->redirect()->toRoute('account-profile');
    }
    
    public function accountAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountAccountForm',
                'User',
                $this->getUserId()
            )
        );
    }
        
    public function companyAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountCompanyForm',
                'User',
                $this->getUserId()
            )
        );
    }
        
    public function contactAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountContactForm',
                'User',
                $this->getUserId()
            )
        );
    }
        
    public function experienceAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountExperienceForm',
                'User',
                $this->getUserId()
            )
        );
    }
    
    public function inboxAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountInboxForm',
                'User',
                $this->getUserId()
            )
        );
    }    
    
    public function membershipAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountMembershipForm',
                'User',
                $this->getUserId()
            )
        );
    }
        
    public function preferencesAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountPreferencesForm',
                'User',
                $this->getUserId()
            )
        );
    }
        
    public function profileAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountProfileForm',
                'User',
                $this->getUserId()
            )
        );        
    }

    public function publishAction()
    {
        return array(
            "form" => $this->processForm(
                'AccountPublishForm',
                'User',
                $this->getUserId()
            )
        );  
    }
}
