<?php
namespace Directorzone\Form\Account;

use Netsensia\Form\NetsensiaForm;

class AccountProfileForm extends NetsensiaForm
{
    public function __construct($name = null, $options = array())
    {
        parent::__construct($name, $options);
    }
    
    public function prepare()
    {
        $this->setFieldPrefix('account-profile-');
        $this->setDefaultIcon('user');

        $this->addTextArea('talent-pool-summary');
        $this->addTextArea('personal-interests');
        
        $this->addSubmit('Submit');
        
        parent::prepare();
    }
}