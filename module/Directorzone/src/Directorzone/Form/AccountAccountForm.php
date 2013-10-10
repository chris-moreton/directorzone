<?php
namespace Directorzone\Form;

use Zend\Form\Element;
use Zend\Form\Fieldset;
use Zend\InputFilter\Input;
use Zend\InputFilter\InputFilter;
use Netsensia\Form\NetsensiaForm;

class AccountAccountForm extends NetsensiaForm
{
    public function __construct($name = null, $options = array())
    {
        parent::__construct($name, $options);
    }
    
    public function prepare()
    {
        $this->setFieldPrefix('account-account-');
        $this->setDefaultIcon('user');
        
        $this->addText('email');
        $this->addText(['name'=>'password', 'icon'=>'lock']);
        $this->addText(['name'=>'password-confirm', 'icon'=>'lock']);
        
        $this->addSubmit('Submit');
        
        parent::prepare();
    }
}
