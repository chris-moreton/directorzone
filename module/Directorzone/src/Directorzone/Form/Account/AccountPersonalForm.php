<?php
namespace Directorzone\Form\Account;

use Netsensia\Form\NetsensiaForm;

class AccountPersonalForm extends NetsensiaForm
{
    public function __construct($name = null, $options = array())
    {
        parent::__construct($name, $options);
    }
    
    public function prepare()
    {
        $this->setFieldPrefix('account-personal-');
        $this->setDefaultIcon('user');
        
        $this->addSelectWithInvisibleOther('title');
        
        $this->addText('forenames');
        $this->addText('surname');
        $this->addSelectWithInvisibleOther('suffix');
        
        $this->addDate(['name'=>'dob', 'label'=>'Date of birth']);
        
        $this->addSelect('gender');
        $this->addSelect('nationality');
        
        $this->addText('pseudonym');
        
        $this->addSubmit('Submit');
        
        parent::prepare();
    }
}