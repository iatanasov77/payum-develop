<?php  namespace App\Controller\VsCms;

use Symfony\Component\HttpFoundation\Request;
use VS\ApplicationBundle\Controller\AbstractCrudController;

class PagesCategoryController extends AbstractCrudController
{
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        $entity->setTranslatableLocale( $form['locale']->getData() );
    }
    
    protected function customData(): array
    {
        return [
            'taxonomyId'    => \App\Entity\Cms\PageCategory::TAXONOMY_ID
        ];
    }
}
