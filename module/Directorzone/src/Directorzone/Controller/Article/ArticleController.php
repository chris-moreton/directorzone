<?php

namespace Directorzone\Controller\Article;

use Netsensia\Controller\NetsensiaActionController;
use Directorzone\Service\ArticleService;
use Symfony\Component\Translation\Exception\NotFoundResourceException;

class ArticleController extends NetsensiaActionController
{
    /**
     * @var ArticleService
     */
    private $articleService;
    
    public function __construct(
        ArticleService $articleService
    )
    {
        $this->articleService = $articleService;
    }
      
    public function indexAction()
    {
        $articleId = $this->params('id');
        $response = $this->getResponse();
       
        try {
            $article = $this->articleService->getArticle($articleId);
            return $article;
        } catch (NotFoundResourceException $e) {
            $this->getResponse()->setStatusCode(404);   
        }
    }
    
    public function listAction()
    {
    }

}