<?php namespace App\Controller\VsCms;

use VS\ApplicationBundle\Controller\AbstractCrudController;
use VS\CmsBundle\Controller\PagesController as BaseController;
use Symfony\Component\HttpFoundation\Request;

//class PagesController extends AbstractCrudController
class PagesController extends BaseController
{
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        parent::prepareEntity( $entity, $form, $request );
    }
    
    protected function customData(): array
    {
        //         $er                         = $this->container->get( 'vs_cms.repository.pages' );
        //         $er2                        = $this->container->get( 'vs_cms.repository.page_categories' );
        //         $customData['items']        = $er->findAll();
        //         $customData['categories']   = $er2->findAll();
        
        $customData = [
            //'formClone'     => $this->createForm( ClonePageForm::class )->createView(),
            //'formPreview'   => $this->createForm( PreviewPageForm::class )->createView(),
        ];
        
        return array_merge( parent::customData(), $customData );
    }
}
