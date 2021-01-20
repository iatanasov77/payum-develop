<?php namespace App\Controller\VsCms;

use VS\ApplicationBundle\Controller\AbstractCrudController;

class PagesController extends AbstractCrudController
{
    protected function prepareEntity( &$entity, $form, Request $request )
    {
        $post   = $request->request->get( 'page_form' );
        
        $entity->getCategory()->setTaxon( $this->getTaxon( $post['category_taxon'] ) );
        $entity->setTranslatableLocale( $form['locale']->getData() );
    }
    
    protected function customData(): array
    {
        return [
            'taxonomyId'    => \App\Entity\Cms\PageCategory::TAXONOMY_ID
        ];
    }
    
    protected function getTaxon( $taxonId )
    {
        return $this->get( 'vs_application.repository.taxon' )->find( $taxonId );
    }
}
